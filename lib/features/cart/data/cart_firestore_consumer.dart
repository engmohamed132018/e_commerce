import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/constant/app_string.dart';
import 'package:e_commerce/core/firebase_helper/firestore_consumer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/functions/public_functions.dart';

class CartFireStoreConsumer extends FireStoreConsumer {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
//!delete data
  @override
  deleteData(String collectionName, String uid, String title) {}
  //!getalldata
  @override
  Future<dynamic> getData(String collectionName, String? uid) async {
    return await getProductsByUid();
  }
  //!set All Data

  @override
  // ignore: avoid_renaming_method_parameters
  setData(Map<String, dynamic> data, {String? title}) async {
    //! get document  id
    final responseCheck = await getDocId();

    if (responseCheck.isEmpty) {
      //!add uid if null

      final uid = await addUidItem();
      //! add product after  add uid field
      await _fireStore
          .collection(AppString.cartCollection)
          .doc(uid)
          .collection(AppString.cartproductNameCollection)
          .add(data);
    } else {
      //! if uid is not empty
      final product = await getProductByUidIdAndTitle(title!);
      if (product.isEmpty) {
        await _fireStore
            .collection(AppString.cartCollection)
            .doc(responseCheck)
            .collection(AppString.cartproductNameCollection)
            .add(data);
      } else {
        updatData(
            AppString.cartCollection, responseCheck, title, AppString.increes);
      }
    }
  }

//!update data
  @override
  updatData(
      String collectionName, String uid, String? title, String incress) async {
    try {
      final id = await _fireStore
          .collection(collectionName)
          .doc(uid)
          .collection(AppString.cartproductNameCollection)
          .where(AppString.productTitle, isEqualTo: title)
          .get();

      DocumentReference documentReference = await _fireStore
          .collection(collectionName)
          .doc(uid)
          .collection(AppString.cartproductNameCollection)
          .doc(id.docs.first.id);
      FirebaseFirestore.instance.runTransaction(
        (transaction) async {
          DocumentSnapshot data = await transaction.get(documentReference);

          if (data.exists) {
            var res = data.data() as Map<String, dynamic>;
            if (incress == AppString.increes) {
              transaction.update(documentReference, {
                AppString.count: res[AppString.count] + 1,
              });
            } else {
              transaction.update(documentReference, {
                AppString.count: res[AppString.count] - 1,
              });
            }
          }
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<String> addUidItem() async {
    try {
      var cachHelperUid =
          getIt<CacheHelper>().getDataString(key: AppString.uid);
      String resultUid = await getDocId();
      if (resultUid.isEmpty) {
        final result = await _fireStore
            .collection(AppString.cartCollection)
            .add({AppString.uid: cachHelperUid});
        return result.id;
      } else {
        return resultUid;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> getDocId() async {
    try {
      var cachHelperUid =
          await getIt<CacheHelper>().getDataString(key: AppString.uid);
      final response = await _fireStore
          .collection(AppString.cartCollection)
          .where(AppString.uid, isEqualTo: cachHelperUid)
          .get();
      return response.docs.first.id;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Map<String, dynamic>> getProductByUidIdAndTitle(String title) async {
    final response = await _fireStore
        .collection(AppString.cartCollection)
        .doc(await getDocId())
        .collection(AppString.cartproductNameCollection)
        .where(AppString.productTitle, isEqualTo: title)
        .get();
    return response.docs.first.data();
  }

  @override
  Future<List<QueryDocumentSnapshot>> getProductsByUid() async {
    final response = await _fireStore
        .collection(AppString.cartCollection)
        .doc(await getDocId())
        .collection(AppString.cartproductNameCollection)
        .get();
    return response.docs;
  }
}

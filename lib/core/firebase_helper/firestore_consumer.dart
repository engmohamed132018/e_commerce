import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FireStoreConsumer {
  Future<dynamic> getData(
    String collectionName,
    String? uid,
  );

  setData(Map<String, dynamic> data, {String? title});

  updatData(
    String collectionName,
    String uid,
    String title,
    String incress,
  );

  deleteData(String collectionName, String uid, String title);

  Future<String> getDocId();
  Future<String> addUidItem();
  Future<List<QueryDocumentSnapshot>> getProductsByUid();
  getProductByUidIdAndTitle(String title);
}

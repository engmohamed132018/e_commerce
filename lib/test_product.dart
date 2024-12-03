import 'package:e_commerce/core/firebase_helper/firestore_consumer.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'features/cart/data/cart_firestore_consumer.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
              text: 'add',
              onpressed: () async {
                // final res = await CartFireStoreConsumer().addUidItem();
                // print('===========================$res');
                // CartFireStoreConsumer().setData({'name': 'mohamed'});
              }),
        ],
      ),
    );
  }
}

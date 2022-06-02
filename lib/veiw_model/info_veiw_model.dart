import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class InfoVeiwModel extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var ref = FirebaseFirestore.instance
      .collection('users')
      .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid);
  void getdata() async {
    await ref.get().then((value) {
      emailController.text = value.docs[0]['email'];
      phoneController.text = value.docs[0]['phoneNum'];
    });
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce/views/home_view/home_view.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  // CollectionReference reff = FirebaseFirestore.instance.collection('users');
  bool opscur = true;
  bool checked = false;
  String dialCodeInitial = '+20';
  CountryCode? selected;
  void selcted(CountryCode code) {
    if (code.dialCode != null) {
      dialCodeInitial = code.dialCode!;
    } else {
      // ignore: avoid_returning_null_for_void
      return null;
    }
    update();
  }

  void isops() {
    opscur = !opscur;
    update();
  }

  void ischecked(bool val) {
    checked = val;
    update();
  }

  // FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // // sign in
  // Future<void> signUp(String email, String password, String name) async {
  //   var results = await firebaseAuth.createUserWithEmailAndPassword(
  //       email: email, password: password);
  //   // ignore: unnecessary_null_comparison
  //   if (results != null) {
  //     reff.doc().set(
  //         {'email': email, 'name': name, 'uid': firebaseAuth.currentUser!.uid});
  //     Get.snackbar('Ok', 'sucess Sign Up');
  //     Get.to(() => const HomeVeiw());
  //   }
  // }

  // // sign up
  // Future<void> signIn(String email, String password) async {
  //   try {
  //     // ignore: unused_local_variable
  //     var result = await firebaseAuth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     // ignore: unnecessary_null_comparison
  //     if (result != null) {
  //       Get.snackbar('Ok', 'sucess Sign in');
  //     }
  //     // ignore: unnecessary_null_comparison

  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       Get.snackbar('erreo', 'user not found');
  //     } else if (e.code == 'wrong-password') {
  //       Get.snackbar('error', 'wrong password');
  //     }
  //   }

  //   // ignore: unnecessary_null_comparison
  // }

// sign in with goegle

}

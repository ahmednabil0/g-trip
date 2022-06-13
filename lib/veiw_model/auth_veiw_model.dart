// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce/views/home_view/home_view.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:g_trip/veiw/homeUSer/home.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference reff = FirebaseFirestore.instance.collection('users');
  bool opscur = true;
  bool isEmail = true;
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

  // ignore: non_constant_identifier_names
  void IsEmail(String txt) {
    isEmail = true;
    if (!EmailValidator.validate(txt)) {
      isEmail = false;
      update();
    }
    update();
  }

  void isops() {
    opscur = !opscur;
    update();
  }

  DateTime dateTime = DateTime(15, 1, 1992);
  Future<void> ubdateDAet(context) async {
    // ignore: unused_local_variable
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(1980),
        lastDate: DateTime(21000));

    update();
  }

  void ischecked(bool val) {
    checked = val;
    update();
  }

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // sign in
  Future<void> signUp(String email, String password, String name,
      String phoneNum, String userName) async {
    var results = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    // ignore: unnecessary_null_comparison
    if (results != null) {
      reff.doc().set({
        'email': email,
        'name': name,
        'uid': firebaseAuth.currentUser!.uid,
        'phoneNum': phoneNum,
        'userName': userName,
        'password': password
      });
      Get.snackbar('Ok', 'sucess Sign Up');
      Get.to(() => const HomeVeiw());
    }
  }

  // // sign up
  Future<void> signIn(String email, String password) async {
    try {
      // ignore: unused_local_variable
      var result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // ignore: unnecessary_null_comparison
      if (result != null) {
        Get.snackbar('Ok', 'sucess Sign in');
        Get.to(() => const HomeVeiw());
      }
      // ignore: unnecessary_null_comparison

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('erreo', 'user not found');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('error', 'wrong password');
      }
    }
  }
  //   // ignore: unnecessary_null_comparison

// sign in with goegle
  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential).then((user) {
      reff.doc().set({
        'email': user.user!.email,
        'name': user.user!.displayName,
        'uid': user.user!.uid,
        'phoneNum': user.user!.phoneNumber,
        'userName': user.user!.displayName,
      });

      Get.to(const HomeVeiw());
    });
  }
}

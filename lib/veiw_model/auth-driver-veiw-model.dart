// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_list_pick/support/code_country.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:g_trip/veiw/home_driver/home_driver.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthDriverVeiwModel extends GetxController {
  bool opscur = true;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference reff = FirebaseFirestore.instance.collection('drivers');
  Future<void> signUp(
    String email,
    String name,
    String phoneNum,
    String date,
    String address,
    String cartype,
    String carname,
    String platenumber,
    String carspaper,
    String driverlicence,
    String driverNationallId,
    String changesPerKilo,
    String accountname,
    String accountnum,
    String bankname,
    String driverid,
    String drivername,
    String pay,
    String password,
  ) async {
    var results = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    // ignore: unnecessary_null_comparison
    if (results != null) {
      reff.doc(firebaseAuth.currentUser!.uid).set({
        'email': email,
        'name': name,
        'uid': firebaseAuth.currentUser!.uid,
        'phoneNum': phoneNum,
        'date': date,
        'address': address,
        'password': password,
        'cartype': cartype,
        'car_name': carname,
        'plate_number': platenumber,
        'cars_paper': carspaper,
        'driver-licence': driverlicence,
        'driver_nation_id': driverNationallId,
        'changesPerKilo': changesPerKilo,
        'payment_method': pay,
        'accountname': accountname,
        'accountnum': accountnum,
        'bankname': bankname,
        'driverid': driverid,
        'drivername': drivername,
        'lat': 0,
        'long': 0,
      });
      Get.snackbar('Ok', 'sucess Sign Up');
      Get.to(() => const HomeDriverVeiw());
    }
  }

  void isops() {
    opscur = !opscur;
    update();
  }

  bool checked = false;

  void ischecked(bool val) {
    checked = val;
    update();
  }

  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController nameCont = TextEditingController();
  TextEditingController phoneCont = TextEditingController();
  TextEditingController dateCont = TextEditingController();
  TextEditingController addresCont = TextEditingController();
  TextEditingController stateCont = TextEditingController();
  TextEditingController ctypeCont = TextEditingController();
  TextEditingController cnameCont = TextEditingController();
  TextEditingController cnumCont = TextEditingController();
  TextEditingController cpaperCont = TextEditingController();
  TextEditingController licencesCont = TextEditingController();
  TextEditingController idCont = TextEditingController();
  TextEditingController cpkCont = TextEditingController();
  TextEditingController anCont = TextEditingController();
  TextEditingController anumCont = TextEditingController();
  TextEditingController bnCont = TextEditingController();
  TextEditingController didCont = TextEditingController();
  TextEditingController dnameCont = TextEditingController();
  String cat = 'master';
  int numa = 0;
  void radiost(String cat1) {
    cat = cat1;
    update();
  }

  void cpage(int numr) {
    numa = numr;
    update();
  }

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

  Future<void> signIn(String email, String password) async {
    try {
      // ignore: unused_local_variable
      var result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // ignore: unnecessary_null_comparison
      if (result != null) {
        Get.snackbar('Ok', 'sucess Sign in');
        Get.to(() => const HomeDriverVeiw());
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
}

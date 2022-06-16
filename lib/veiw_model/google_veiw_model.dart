import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/state_manager.dart';

class GoogleVeiwModel extends GetxController {
  var ref = FirebaseFirestore.instance.collection('drivers');

  Future getposition() async {
    LocationPermission locate;
    locate = await Geolocator.checkPermission();
    if (locate == LocationPermission.denied) {
      locate = await Geolocator.requestPermission();
    }
  }

  // ignore: prefer_typing_uninitialized_variables
  var lat;
  // ignore: prefer_typing_uninitialized_variables
  var long;
  Future<void> getlanlong() async {
    await Geolocator.getCurrentPosition().then((value) {
      lat = value.latitude;
      long = value.longitude;
    });
    await ref
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'lat': lat, 'long': long});
  }

  @override
  void onInit() async {
    await getposition();
    getlanlong();
    super.onInit();
  }
}

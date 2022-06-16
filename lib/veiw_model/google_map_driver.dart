import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:g_trip/model/driver_model.dart';
import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleVeiwDriverModel extends GetxController {
  var ref = FirebaseFirestore.instance.collection('drivers');
  late final CameraPosition kGooglePlex;
  Set<Marker> mymarker = {};
  void setmarker() {
    mymarker.clear();
    for (var element in driverlist) {
      mymarker.add(Marker(
          markerId: MarkerId(element.driverid),
          position: LatLng(element.lat, element.long),
          infoWindow: InfoWindow(
              title: element.drivername,
              snippet: element.cartype + ',' + element.car_name)));
    }
  }

  List<DriverModel> driverlist = [];

  // ignore: prefer_typing_uninitialized_variables
  var lat;
  // ignore: prefer_typing_uninitialized_variables
  var long;
  final CollectionReference driverRef =
      FirebaseFirestore.instance.collection('drivers');
  getDriverData() async {
    await driverRef.get().then((value) {
      driverlist.clear();
      for (var i in value.docs) {
        driverlist.add(DriverModel.fromMap(i));
        // print(value.docs[1]['lat']);
        // print(value.docs[1]['long']);
      }
      update();
    });
  }

  @override
  void onInit() async {
    kGooglePlex = const CameraPosition(
      target: LatLng(31.005479, 31.006004),
      zoom: 11,
    );
    await getDriverData();
    setmarker();

    super.onInit();
  }
}

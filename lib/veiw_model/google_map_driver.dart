// ignore_for_file: unused_local_variable, avoid_print, prefer_typing_uninitialized_variables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:g_trip/model/driver_model.dart';

class GoogleVeiwDriverModel extends GetxController {
  String carType = '';
  void cart(String ct) {
    carType = ct;
    update();
  }

  var refd = FirebaseFirestore.instance.collection('users');

  Future getposition() async {
    LocationPermission locate;
    locate = await Geolocator.checkPermission();
    if (locate == LocationPermission.denied) {
      locate = await Geolocator.requestPermission();
    }
  }

  var refData = FirebaseFirestore.instance.collection('orders');
  void sendData() async {
    var disCont = Geolocator.distanceBetween(
        latc ??= 0.0, longc ??= 0.0, latd ??= 31.005479, longd ??= 31.006004);
    var diskm = disCont / 1000;
    String destance = '${diskm.toStringAsFixed(2)}km';

    List<Placemark> source =
        await placemarkFromCoordinates(latc ??= 0.0, longc ??= 0.0);
    List<Placemark> destination =
        await placemarkFromCoordinates(latd ??= 31.005479, longd ??= 31.006004);
    await refData.doc(FirebaseAuth.instance.currentUser!.uid).set({
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'did': '',
      'details': 'from ${source[0].street} to ${destination[0].street}',
      'destance': destance,
      'lats': latc ??= 0.0,
      'longs': longc ??= 0.0,
      'latd': latd ??= 0.0,
      'longd': longd ??= 0.0,
      'end': false,
      'starttime': '',
      'endtime': ''
    });
  }

  var latc;
  var longc;
  var latd;
  var longd;
  Future<void> getlanlong() async {
    await Geolocator.getCurrentPosition().then((value) {
      latc = value.latitude;
      longc = value.longitude;
    });
    List<Placemark> placemark = await placemarkFromCoordinates(latc, longc);
    // print(placemark[0].);
    sourceCont.text = placemark[0].street!;
    await refd
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'lat': latc, 'long': longc});
  }

  Future<void> showSearchDialog(context) async {
    Prediction? p = await PlacesAutocomplete.show(
        offset: 0,
        radius: 1000,
        types: [],
        strictbounds: false,
        region: "ar",
        context: context,
        apiKey: 'AIzaSyCJ1n1vthLwdbp4UK81_VJ63e3FeRqIZZw',
        mode: Mode.overlay,
        language: "ar",
        components: [Component(Component.country, "ar")]);
    getLocationFromPlaceId(p!.placeId!);
  }

  Future<void> getLocationFromPlaceId(String placeId) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(
      apiKey: 'AIzaSyCJ1n1vthLwdbp4UK81_VJ63e3FeRqIZZw',
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );

    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(placeId);
    List<Placemark> placemark = await placemarkFromCoordinates(
        detail.result.geometry!.location.lat,
        detail.result.geometry!.location.lng);
    // print(placemark[0].);
    sourceCont.text = placemark[0].street!;

    // _animateCamera(LatLng(detail.result.geometry!.location.lat,
    //     detail.result.geometry!.location.lng));
  }

  TextEditingController sourceCont = TextEditingController();
  TextEditingController desCont = TextEditingController();
  var ref = FirebaseFirestore.instance.collection('drivers');
  late final CameraPosition kGooglePlex;
  Set<Marker> mymarker = {};
  GoogleMapController? gmc;
  void setmarker() async {
    mymarker.clear();
    for (var element in driverlist) {
      mymarker.add(Marker(
          flat: true,
          icon: await BitmapDescriptor.fromAssetImage(
              ImageConfiguration.empty, 'assets/images/marker.png'),
          // icon: await BitmapDescriptor.fromAssetImage(
          //     ImageConfiguration.empty, 'assets/images/carmarker.png' ),
          onTap: () {
            // print(element.email);
            // LatLng latlang = LatLng(element.lat, element.long);
            // gmc?.animateCamera(CameraUpdate.newLatLngZoom(latlang, 17));
            // kGooglePlex = CameraPosition(
            //   target: LatLng(element.lat, element.long),
            //   zoom: 12.4746,
            // );
            // update();
            Get.bottomSheet(Container());
          },
          markerId: MarkerId(element.driverid),
          position: LatLng(element.lat, element.long),
          infoWindow: InfoWindow(
              title: element.drivername,
              snippet: element.cartype + ',' + element.car_name)));
    }
  }

  List<DriverModel> driverlist = [];

  var lat;
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
    // await getposition();
    // await getlanlong();
    kGooglePlex = const CameraPosition(
        target: LatLng(31.005479, 31.006004), zoom: 18, tilt: 0.0);
    await getDriverData();
    setmarker();
    await getposition();
    await getlanlong();

    super.onInit();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:g_trip/veiw/widgets/bigbutton.dart';
import 'package:g_trip/veiw/widgets/rowcol.dart';
import 'package:g_trip/veiw_model/google_map_driver.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class ExploreVeiw extends GetWidget<GoogleVeiwDriverModel> {
  ExploreVeiw({Key? key}) : super(key: key);
  @override
  final controller = Get.put(GoogleVeiwDriverModel());
  GoogleMapController? gmc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.5,
              child: GetBuilder<GoogleVeiwDriverModel>(
                builder: (controller) => Stack(
                  children: [
                    GoogleMap(
                        onLongPress: (argument) async {
                          controller.latd = argument.latitude;
                          controller.longd = argument.longitude;
                          // ignore: unused_local_variable
                          List<Placemark> placemark =
                              await placemarkFromCoordinates(
                                  controller.latd, controller.longd);
                          controller.desCont.text = placemark[0].street!;
                        },
                        markers: controller.mymarker,
                        indoorViewEnabled: true,
                        initialCameraPosition: controller.kGooglePlex,
                        onMapCreated: (GoogleMapController controller) {
                          gmc = controller;
                        }),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.015,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: Get.width * 0.035),
              width: Get.width * 1,
              height: Get.height * 0.11,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Get.width * 0.12),
                      bottomLeft: Radius.circular(Get.width * 0.12))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      controller.cart('scoter');
                    },
                    child: Padding(
                      padding: EdgeInsets.all(Get.height * 0.0088),
                      child: RowCol(
                        txt: ' Scoter',
                        icon: Icons.moped_outlined,
                        color: controller.carType == 'scoter'
                            ? Colors.blueAccent
                            : Colors.white,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.cart('car');
                    },
                    child: Padding(
                      padding: EdgeInsets.all(Get.height * 0.0088),
                      child: RowCol(
                          txt: ' Car',
                          icon: Icons.car_repair,
                          color: controller.carType == 'car'
                              ? Colors.blueAccent
                              : Colors.white),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.cart('truck');
                    },
                    child: Padding(
                      padding: EdgeInsets.all(Get.height * 0.0088),
                      child: RowCol(
                          txt: ' Truck',
                          icon: Icons.chair_alt_rounded,
                          color: controller.carType == 'truck'
                              ? Colors.blueAccent
                              : Colors.white),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.cart('bus');
                    },
                    child: Padding(
                      padding: EdgeInsets.all(Get.height * 0.0088),
                      child: RowCol(
                          txt: ' Bus',
                          icon: Icons.directions_bus_filled_outlined,
                          color: controller.carType == 'bus'
                              ? Colors.blueAccent
                              : Colors.white),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Get.width * 0.025,
            ),
            SizedBox(
              height: Get.width * 0.32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset('assets/svg/New Text Document (2).svg'),
                  SizedBox(
                    width: Get.width * 0.8,
                    child: Column(
                      children: [
                        Material(
                          elevation: 6,
                          shadowColor: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: TextFormField(
                              onTap: () async {},
                              controller: controller.sourceCont,
                              decoration: InputDecoration(
                                  hintText: 'Pickup point',
                                  isDense: true, // important line
                                  contentPadding: EdgeInsets.fromLTRB(
                                      Get.width * 0.01,
                                      Get.width * 0.04,
                                      Get.width * 0.01,
                                      Get.width *
                                          0.04), // control your hints text size
                                  hintStyle: const TextStyle(
                                      letterSpacing: 1,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                  fillColor: Colors.white30,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1.2,
                                          color:
                                              Colors.black.withOpacity(0.2)))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.width * 0.02,
                        ),
                        Material(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: TextFormField(
                              onTap: () {
                                controller.showSearchDialog(context);
                              },
                              controller: controller.desCont,
                              decoration: InputDecoration(
                                  hintText: 'Destination point',
                                  isDense: true, // important line
                                  contentPadding: EdgeInsets.fromLTRB(
                                    Get.width * 0.01,
                                    Get.width * 0.04,
                                    Get.width * 0.01,
                                    Get.width * 0.04,
                                  ), // control your hints text size
                                  hintStyle: const TextStyle(
                                    letterSpacing: 1,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  fillColor: Colors.white30,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1.7,
                                          color:
                                              Colors.black.withOpacity(0.2)))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BigButton2(
                      txt: 'look up for instance',
                      ontap: () {
                        controller.sendData();
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable

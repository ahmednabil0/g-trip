import 'package:flutter/material.dart';
import 'package:g_trip/veiw/widgets/bigbutton.dart';
import 'package:g_trip/veiw/widgets/rowcol.dart';
import 'package:g_trip/veiw_model/google_map_driver.dart';
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
              height: Get.height * 0.04,
            ),
            Container(
              margin: EdgeInsets.only(left: Get.width * 0.035),
              width: Get.width * 1,
              height: Get.height * 0.12,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Get.width * 0.12),
                      bottomLeft: Radius.circular(Get.width * 0.12))),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(Get.height * 0.0088),
                    child:
                        RowCol(txt: 'Share jop', icon: Icons.history_rounded),
                  ),
                  Padding(
                    padding: EdgeInsets.all(Get.height * 0.0088),
                    child: RowCol(
                        txt: 'Driver Network',
                        icon: Icons.person_pin_circle_outlined),
                  ),
                  Padding(
                    padding: EdgeInsets.all(Get.height * 0.0088),
                    child: RowCol(
                        txt: 'history', icon: Icons.history_edu_outlined),
                  ),
                  Padding(
                    padding: EdgeInsets.all(Get.height * 0.0088),
                    child: RowCol(txt: 'Payment', icon: Icons.paypal_rounded),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BigButton2(txt: 'look up for instance', ontap: () {}),
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

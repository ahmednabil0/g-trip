import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g_trip/helper/consts.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class getSterted extends StatelessWidget {
  const getSterted({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [
        Positioned(
          top: Get.height * -142 / 896,
          left: Get.height * -140 / 896,
          child: RotationTransition(
            turns: const AlwaysStoppedAnimation(-30 / 360),
            child: Container(
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(10)),
              height: Get.height * 390 / 896,
              width: Get.width * 525 / 414,
            ),
          ),
        ),
        Positioned(
          bottom: Get.height * -225 / 896,
          right: Get.height * -160 / 896,
          child: RotationTransition(
            turns: const AlwaysStoppedAnimation(-30 / 360),
            child: Container(
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(10)),
              height: Get.height * 390 / 896,
              width: Get.width * 525 / 414,
            ),
          ),
        ),
        Positioned(
            left: 160,
            top: 55,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(Get.height * 3.5 / 896),
                  child: SvgPicture.asset('assets/svg/logotext.svg',
                      height: Get.height * 25 / 896),
                ),
                Container(
                    padding: EdgeInsets.all(Get.height * 8 / 896),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    child: SvgPicture.asset('assets/svg/logo.svg')),
              ],
            ))
      ]),
    );
  }
}

// ignore: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:g_trip/helper/consts.dart';
import 'package:get/get.dart';

class BigButton extends StatelessWidget {
  const BigButton({Key? key, required this.txt, required this.ontap})
      : super(key: key);
  final String txt;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 20),
        height: Get.height * 0.052,
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(25)),
        child: Text(
          txt,
          style: TextStyle(
              color: backgroundColor,
              fontSize: Get.width * 0.045,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class BigButton2 extends StatelessWidget {
  const BigButton2({Key? key, required this.txt, required this.ontap})
      : super(key: key);
  final String txt;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 20),
        height: Get.height * 0.043,
        width: Get.width * 0.48,
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(5)),
        child: Text(
          txt,
          style: TextStyle(
            color: backgroundColor,
            fontSize: Get.width * 0.032,
          ),
        ),
      ),
    );
  }
}

class BigButton3 extends StatelessWidget {
  const BigButton3({Key? key, required this.txt, required this.ontap})
      : super(key: key);
  final String txt;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        height: Get.height * 0.040,
        width: Get.width * 0.17,
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(10)),
        child: Text(
          txt,
          style: TextStyle(
              color: backgroundColor,
              fontSize: Get.width * 0.038,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:g_trip/helper/consts.dart';
import 'package:g_trip/veiw/widgets/customtext.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class getStartedButton extends StatelessWidget {
  const getStartedButton({
    required this.ontap,
    Key? key,
  }) : super(key: key);
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: Get.height * 140 / 896,
        height: Get.height * 38 / 896,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Get.height * 30 / 896),
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.5,
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset(3, 3),
                  blurRadius: 3)
            ],
            color: secondcolor),
        child: Center(
          child: customText(
              fw: FontWeight.w600,
              color: white,
              txt: 'Get Started',
              size: Get.height * 20 / 896),
        ),
      ),
    );
  }
}

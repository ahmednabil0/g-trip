import 'package:flutter/material.dart';
import 'package:g_trip/helper/consts.dart';
import 'package:g_trip/veiw/widgets/customtext.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RowCol extends StatelessWidget {
  RowCol({
    required this.txt,
    required this.icon,
    required this.color,
    Key? key,
  }) : super(key: key);
  String txt;
  IconData icon;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: Get.width * 0.035),
          width: Get.height * 0.07,
          height: Get.height * 0.07,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Icon(
            icon,
            size: Get.height * 0.065,
            color: fontColor,
          ),
        ),
        customText(
          color: fontColor,
          txt: txt,
          size: Get.width * 0.033,
          fw: FontWeight.bold,
        )
      ],
    );
  }
}

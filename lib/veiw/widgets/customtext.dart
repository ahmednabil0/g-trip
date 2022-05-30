// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class customText extends StatelessWidget {
  customText({
    required this.color,
    required this.txt,
    required this.size,
    this.fw,
    Key? key,
  }) : super(key: key);
  String txt;
  double size;
  Color color;
  FontWeight? fw;

  @override
  Widget build(BuildContext context) {
    return Text(txt,
        style: TextStyle(
            fontSize: Get.height * size / 896, fontWeight: fw, color: color));
  }
}

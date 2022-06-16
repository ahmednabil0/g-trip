import 'package:flutter/material.dart';
import 'package:g_trip/veiw_model/google_veiw_model.dart';
import 'package:get/get.dart';

class ExploreDriverVeiw extends GetWidget<GoogleVeiwModel> {
  ExploreDriverVeiw({Key? key}) : super(key: key);
  @override
  final controller = Get.put(GoogleVeiwModel());

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

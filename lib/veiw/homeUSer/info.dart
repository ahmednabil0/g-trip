import 'package:flutter/material.dart';
import 'package:g_trip/helper/consts.dart';
import 'package:g_trip/veiw/widgets/customtext.dart';
import 'package:g_trip/veiw_model/info_veiw_model.dart';
import 'package:get/get.dart';

class InfoVeiw extends GetWidget<InfoVeiwModel> {
  InfoVeiw({Key? key}) : super(key: key);
  final cont = Get.put(InfoVeiwModel());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05, vertical: 15),
      child: Form(
        child: GetBuilder<InfoVeiwModel>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: Get.width * 0.015),
                child: customText(
                  color: fontColor,
                  txt: 'Email',
                  size: Get.width * .045,
                  fw: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.72,
                    child: TextFormField(
                      controller: controller.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter name";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      readOnly: true,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: fontColor.withOpacity(0.3),
                                  width: 1.35)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: fontColor.withOpacity(0.3),
                                  width: 1.35)),
                          hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.8),
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit_calendar_outlined,
                        size: Get.width * 0.088,
                        color: fontColor.withOpacity(0.5),
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Get.width * 0.015),
                child: customText(
                  color: fontColor,
                  txt: 'Phone N`',
                  size: Get.width * .045,
                  fw: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.72,
                    child: TextFormField(
                      controller: controller.phoneController,
                      keyboardType: TextInputType.phone,
                      readOnly: true,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: fontColor.withOpacity(0.3),
                                  width: 1.35)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: fontColor.withOpacity(0.3),
                                  width: 1.35)),
                          hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.8),
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit_calendar_outlined,
                        size: Get.width * 0.088,
                        color: fontColor.withOpacity(0.5),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

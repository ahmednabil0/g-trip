import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:g_trip/helper/consts.dart';
import 'package:g_trip/veiw/Auth_veiw/signup_driver/change_setting.dart';
import 'package:g_trip/veiw/Auth_veiw/signup_driver/main_person_info.dart';
import 'package:g_trip/veiw/Auth_veiw/signup_driver/second_person_info.dart';
import 'package:g_trip/veiw/widgets/customtext.dart';
import 'package:g_trip/veiw_model/auth-driver-veiw-model.dart';
import 'package:get/get.dart';

class SignUpDriverVeiw extends GetWidget<AuthDriverVeiwModel> {
  SignUpDriverVeiw({Key? key}) : super(key: key);
  final cont = Get.put(AuthDriverVeiwModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.height * 20 / 896),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 20 / 896,
                ),
                GetBuilder<AuthDriverVeiwModel>(
                  builder: (controller) => DefaultTabController(
                    initialIndex: controller.numa,
                    length: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Get.height * 90 / 896,
                          child: Stack(children: [
                            TabBar(
                              physics: const BouncingScrollPhysics(),
                              unselectedLabelColor: fontColor.withOpacity(0.5),
                              indicatorColor: primaryColor,
                              automaticIndicatorColorAdjustment: true,
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Get.height * 14 / 896),
                              tabs: [
                                Column(
                                  children: [
                                    customText(
                                        color: fontColor,
                                        txt: '01',
                                        size: Get.height * 14 / 896),
                                    const Text('Personal Info',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    customText(
                                        color: fontColor,
                                        txt: '02',
                                        size: Get.height * 14 / 896),
                                    const Text('Personal Info',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    customText(
                                        color: fontColor,
                                        txt: '03',
                                        size: Get.height * 14 / 896),
                                    const Text('Change Settings',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                              indicator: ContainerTabIndicator(
                                radius: BorderRadius.circular(10),
                                widthFraction: 0.8,
                                height: 5,
                                padding:
                                    EdgeInsets.only(top: Get.height * 18 / 896),
                                color: primaryColor,
                              ),
                            ),
                          ]),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: Get.height * 750 / 896,
                                child: TabBarView(
                                  physics: const BouncingScrollPhysics(),
                                  children: [
                                    MainInfoDriverVeiw(),
                                    SecondInfoDriverVeiw(),
                                    ChangeSettingDriverVeiw(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

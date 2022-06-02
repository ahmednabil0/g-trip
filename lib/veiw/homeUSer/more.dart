import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:g_trip/helper/consts.dart';
import 'package:g_trip/veiw/homeUSer/MyWallet.dart';
import 'package:g_trip/veiw/homeUSer/info.dart';
import 'package:g_trip/veiw/homeUSer/token.dart';
import 'package:g_trip/veiw/widgets/customtext.dart';
import 'package:get/get.dart';

class MoreInfoVeiw extends StatefulWidget {
  const MoreInfoVeiw({Key? key}) : super(key: key);

  @override
  State<MoreInfoVeiw> createState() => _MoreInfoVeiwState();
}

class _MoreInfoVeiwState extends State<MoreInfoVeiw>
    with SingleTickerProviderStateMixin {
  TabController? mycontroller;
  @override
  void initState() {
    mycontroller = TabController(length: 2, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SvgPicture.asset(
                    'assets/svg/New Text Document.svg',
                    height: Get.width * .8,
                    alignment: Alignment.topCenter,
                  ),
                  Positioned(
                      left: Get.width * .001,
                      top: Get.width * .45,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: Get.width * .22,
                                height: Get.width * .22,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffC4C4C4)),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(Get.width * 0.02),
                            child: customText(
                              color: fontColor,
                              txt: 'ahmed NABIL',
                              size: Get.width * .054,
                              fw: FontWeight.w600,
                            ),
                          )
                        ],
                      )),
                ],
              ),
              DefaultTabController(
                length: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                      child: Stack(children: [
                        TabBar(
                          physics: const BouncingScrollPhysics(),
                          unselectedLabelColor: fontColor.withOpacity(0.5),
                          indicatorColor: primaryColor,
                          automaticIndicatorColorAdjustment: true,
                          labelStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          tabs: const [
                            Text('Personal Info',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            Text('My Wallet',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            Text('Tocken Bouns',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ],
                          indicator: ContainerTabIndicator(
                            radius: BorderRadius.circular(10),
                            widthFraction: 0.9,
                            height: 17,
                            heightFraction: 10,
                            padding: const EdgeInsets.only(top: 11),
                            color: primaryColor,
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 400,
                      child: TabBarView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          InfoVeiw(),
                          const MyWallet(),
                          const TokenVeiw(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

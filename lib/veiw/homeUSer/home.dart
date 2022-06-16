import 'package:flutter/material.dart';
import 'package:g_trip/helper/consts.dart';
import 'package:g_trip/veiw/homeUSer/explore.dart';
import 'package:g_trip/veiw/homeUSer/help.dart';
import 'package:g_trip/veiw/homeUSer/history.dart';
import 'package:g_trip/veiw/homeUSer/more.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeVeiw extends StatefulWidget {
  const HomeVeiw({Key? key}) : super(key: key);

  @override
  State<HomeVeiw> createState() => _HomeVeiwState();
}

class _HomeVeiwState extends State<HomeVeiw> {
  int currenntIndex = 0;
  List<Widget> bodyList = [
    ExploreVeiw(),
    const HistoryVeiw(),
    const HelpVeiw(),
    const MoreInfoVeiw()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyList[currenntIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        padding: EdgeInsets.all(Get.width * .01),
        child: GNav(
            style: GnavStyle.oldSchool,
            textStyle: TextStyle(
                fontSize: Get.width * .05,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            curve: Curves.easeInToLinear,
            duration: const Duration(milliseconds: 200),
            color: Colors.grey.shade500,
            padding: EdgeInsets.symmetric(
                vertical: Get.height * 1 / 812,
                horizontal: Get.height * 1 / 812),
            iconSize: Get.width * 0.095,
            activeColor: Colors.white,
            selectedIndex: currenntIndex,
            onTabChange: (index) {
              setState(() {
                currenntIndex = index;
              });
            },
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
              ),
              GButton(
                icon: Icons.content_paste_search_rounded,
                text: 'History',
              ),
              GButton(
                icon: Icons.help_outline_rounded,
                text: 'Help',
              ),
              GButton(
                icon: Icons.read_more_sharp,
                text: 'More',
              )
            ]),
      ),
    );
  }
}

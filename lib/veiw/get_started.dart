import 'package:flutter/material.dart';
import 'package:g_trip/helper/consts.dart';
import 'package:g_trip/veiw/Auth_veiw/sign_in_driver/sign_in_veiw.dart';
import 'package:g_trip/veiw/Auth_veiw/sign_in_veiw.dart';
import 'package:g_trip/veiw/Auth_veiw/sign_up_driver.dart';
import 'package:g_trip/veiw/widgets/customtext.dart';
import 'package:g_trip/veiw/widgets/getstarted.dart';
import 'package:g_trip/veiw/widgets/getstertedbutton.dart';
import 'package:get/get.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({Key? key}) : super(key: key);

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  // ignore: prefer_typing_uninitialized_variables
  var selecteditem;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables, unused_local_variable
    return Scaffold(
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(children: [
            const getSterted(),
            Positioned(
                bottom: Get.height * 270 / 896,
                right: Get.height * 0 / 896,
                child: Image.asset('assets/images/selogo.png')),
            Positioned(
                top: Get.height * 620 / 896,
                left: Get.height * 50 / 896,
                child: Container(
                  height: Get.height * 41 / 896,
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.height * 20 / 896,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 0.5,
                            color: Colors.grey.withOpacity(0.5),
                            offset: const Offset(3, 3),
                            blurRadius: 3)
                      ],
                      color: Colors.white),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        elevation: 5,
                        hint: customText(
                            color: fontColor.withOpacity(0.5),
                            fw: FontWeight.bold,
                            txt:
                                'who are you ?                                   ',
                            size: Get.height * 20 / 896),
                        value: selecteditem,
                        items: ['driver', 'customer']
                            .map((e) => DropdownMenuItem(
                                  // ignore: unnecessary_string_interpolations
                                  child: Text('$e'),
                                  value: e,
                                  enabled: true,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            selecteditem = val;
                          });
                        }),
                  ),
                )),
            Positioned(
                bottom: Get.height * 25 / 896,
                right: Get.height * 15 / 896,
                child: getStartedButton(ontap: () {
                  selecteditem == 'customer'
                      ? Get.to(SignInView())
                      : Get.to(() => SignInDdiverView());
                }))
          ])),
    );
  }
}

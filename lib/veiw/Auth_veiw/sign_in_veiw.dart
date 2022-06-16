// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g_trip/helper/consts.dart';
import 'package:g_trip/veiw/Auth_veiw/sign_up_veiw.dart';
import 'package:g_trip/veiw/widgets/bigbutton.dart';
import 'package:g_trip/veiw/widgets/customtext.dart';
import 'package:g_trip/veiw_model/auth_veiw_model.dart';
import 'package:get/get.dart';

class SignInView extends GetWidget<AuthViewModel> {
  SignInView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(AuthViewModel());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<AuthViewModel>(
          builder: (controller) => Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Container(
                      padding: EdgeInsets.all(Get.height * 8 / 896),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: SvgPicture.asset('assets/svg/logo.svg')),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(
                              fw: FontWeight.w500,
                              color: fontColor.withOpacity(0.7),
                              txt: 'proceed with your',
                              size: Get.height * 20 / 896),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: Get.height * 5 / 896),
                            child: customText(
                                fw: FontWeight.w700,
                                color: fontColor.withOpacity(0.7),
                                txt: 'Login',
                                size: Get.height * 30 / 896),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: _key,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Get.height * 0.05,
                              ),
                              Text(
                                'username/email',
                                style: TextStyle(
                                    fontSize: Get.width * 0.035,
                                    fontWeight: FontWeight.w400),
                              ),
                              TextFormField(
                                controller: emailCont,
                                validator: ((value) {
                                  if (value == null || value.isEmpty) {
                                    return "please enter email";
                                  }

                                  return null;
                                }),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    suffixIcon:
                                        const Icon(Icons.person_outline),
                                    hintText: 'Duran0124r',
                                    hintStyle: TextStyle(
                                        color: Colors.grey.withOpacity(0.8),
                                        fontWeight: FontWeight.w500)),
                              ),
                              SizedBox(
                                height: Get.height * 0.025,
                              ),
                              Text(
                                'password',
                                style: TextStyle(
                                    fontSize: Get.width * 0.035,
                                    fontWeight: FontWeight.w400),
                              ),
                              TextFormField(
                                controller: passCont,
                                validator: ((value) {
                                  if (value == null || value.isEmpty) {
                                    return "please enter password";
                                  }

                                  return null;
                                }),
                                obscureText: controller.opscur,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    suffixIcon: SvgPicture.asset(
                                      'assets/svg/key.svg',
                                      fit: BoxFit.scaleDown,
                                      width: 7,
                                      height: 7,
                                      color: fontColor,
                                    ),
                                    suffix: IconButton(
                                        onPressed: () {
                                          controller.isops();
                                        },
                                        icon: Icon(controller.opscur
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined),
                                        iconSize: 22),
                                    hintText: '******************',
                                    hintStyle: TextStyle(
                                        color: Colors.grey.withOpacity(0.8),
                                        fontWeight: FontWeight.w500)),
                              ),
                              SizedBox(
                                  height: Get.width * 0.12,
                                  child: Row(
                                    children: [
                                      customText(
                                        color: fontColor,
                                        txt: 'Remember me',
                                        size: Get.width * 0.04,
                                        fw: FontWeight.w800,
                                      ),
                                      const Spacer(),
                                      GetBuilder<AuthViewModel>(
                                        builder: (controller) => Switch(
                                          value: controller.checked,
                                          onChanged: (val) {
                                            controller.ischecked(val);
                                          },
                                          inactiveThumbColor: Colors.grey,
                                          hoverColor: primaryColor,
                                          activeColor: primaryColor,
                                          inactiveTrackColor:
                                              Colors.grey.withOpacity(0.3),
                                        ),
                                      )
                                    ],
                                  )),
                              BigButton(
                                  txt: 'Login ',
                                  ontap: () async {
                                    if (_key.currentState!.validate()) {
                                      late String username;
                                      await FirebaseFirestore.instance
                                          .collection('users')
                                          .where('userName',
                                              isEqualTo: emailCont.text)
                                          .get()
                                          .then((value) {
                                        username = value.docs[0]['email'];
                                      });
                                      controller.IsEmail(emailCont.text);
                                      controller.signIn(
                                          controller.isEmail
                                              ? emailCont.text
                                              : username,
                                          passCont.text);
                                    }
                                  }),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      'forget password?',
                                      style: TextStyle(
                                          fontSize: Get.width * 0.032,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(width: Get.width * 0.03),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => SignUpView());
                                    },
                                    child: customText(
                                      color: fontColor,
                                      txt: 'Sign Up',
                                      size: Get.width * 0.04,
                                      fw: FontWeight.w800,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                      SizedBox(
                        height: Get.width * 0.09,
                      ),
                      Column(
                        children: [
                          Center(
                            child: customText(
                              color: fontColor,
                              txt: 'Login With',
                              size: Get.width * 0.04,
                              fw: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: Get.width * 0.04),
                          SizedBox(
                            width: Get.width * 0.41,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: () async {
                                      controller.googleSignInMethod();
                                    },
                                    child: SvgPicture.asset(
                                        'assets/svg/goegle.svg')),
                                InkWell(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                        'assets/svg/githup.svg')),
                                InkWell(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                        'assets/svg/twitter.svg')),
                                InkWell(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                        'assets/svg/facebook.svg')),
                              ],
                            ),
                          ),
                          SizedBox(height: Get.width * 0.055),
                          SvgPicture.asset('assets/svg/line.svg')
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

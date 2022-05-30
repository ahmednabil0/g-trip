import 'package:country_list_pick/country_list_pick.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g_trip/helper/consts.dart';
import 'package:g_trip/veiw/Auth_veiw/sign_in_veiw.dart';
import 'package:g_trip/veiw/widgets/customtext.dart';
import 'package:g_trip/veiw_model/auth_veiw_model.dart';
import 'package:get/get.dart';

import '../widgets/bigbutton.dart';

class SignUpView extends GetWidget<AuthViewModel> {
  SignUpView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(AuthViewModel());
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  final TextEditingController nameCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthViewModel>(
        builder: (controller) => Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: Get.height * 25 / 896),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.09,
                  ),
                  Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Text(
                            'FullName',
                            style: TextStyle(
                                fontSize: Get.width * 0.035,
                                fontWeight: FontWeight.w400),
                          ),
                          TextFormField(
                            controller: nameCont,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please enter name";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                hintText: 'Abdul Lazirh',
                                hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Text(
                            'E-mail address',
                            style: TextStyle(
                                fontSize: Get.width * 0.035,
                                fontWeight: FontWeight.w400),
                          ),
                          TextFormField(
                            controller: emailCont,
                            validator: (value) {
                              // ignore: unnecessary_null_comparison
                              if (value!.isEmpty || value == null) {
                                return "please enter the email";
                              }
                              if (!EmailValidator.validate(value)) {
                                return "enter correct email ";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                suffixIcon: const Icon(Icons.email_outlined),
                                hintText: 'myemail@gmail.com',
                                hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Text(
                            'Phone number',
                            style: TextStyle(
                                fontSize: Get.width * 0.035,
                                fontWeight: FontWeight.w400),
                          ),
                          TextFormField(
                            controller: nameCont,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please enter name";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                prefixIcon: CountryListPick(
                                  useSafeArea: false,

                                  theme: CountryTheme(
                                    isShowFlag: true,
                                    isShowTitle: false,
                                    isShowCode: true,
                                    isDownIcon: true,
                                    showEnglishName: true,
                                    labelColor: Colors.blueAccent,
                                  ),
                                  initialSelection: controller.dialCodeInitial,
                                  onChanged: (CountryCode? code) {
                                    controller.selcted(code!);
                                  },
                                  // or
                                  // initialSelection: 'US'
                                ),
                                suffixIcon: const Icon(Icons.phone_outlined),
                                hintText: '01025125445',
                                hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Text(
                            'UserName',
                            style: TextStyle(
                                fontSize: Get.width * 0.035,
                                fontWeight: FontWeight.w400),
                          ),
                          TextFormField(
                            controller: nameCont,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please enter name";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                hintText: 'Duran0124r',
                                suffixIcon:
                                    const Icon(Icons.person_outline_outlined),
                                hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Text(
                            'Password',
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
                              if (!RegExp(r'^(?=.*?[0-9]).{8,}$')
                                  .hasMatch(value)) {
                                return 'week password';
                              }
                              if (value.length > 26) {
                                return "to big";
                              }
                              return null;
                            }),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: controller.opscur,
                            decoration: InputDecoration(
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
                                        : Icons.visibility_off_outlined)),
                                hintText: '****************',
                                hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Text(
                            'Confirm password',
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
                              if (!RegExp(r'^(?=.*?[0-9]).{8,}$')
                                  .hasMatch(value)) {
                                return 'week password';
                              }
                              if (value.length > 26) {
                                return "to big";
                              }
                              return null;
                            }),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: controller.opscur,
                            decoration: InputDecoration(
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
                                        : Icons.visibility_off_outlined)),
                                hintText: '****************',
                                hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: BigButton(
                                txt: 'SIGN Up ',
                                ontap: () async {
                                  // if (_key.currentState!.validate()) {
                                  //   await controller.signUp(emailCont.text,
                                  //       passCont.text, nameCont.text

                                  //       );
                                  // }
                                }),
                          ),
                          SizedBox(
                            height: Get.height * 0.038,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    'Already have an account',
                                    style: TextStyle(
                                        fontSize: Get.width * 0.032,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(width: Get.width * 0.03),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => SignInView());
                                  },
                                  child: customText(
                                    color: fontColor,
                                    txt: 'Sign In',
                                    size: Get.width * 0.04,
                                    fw: FontWeight.w800,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ))
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

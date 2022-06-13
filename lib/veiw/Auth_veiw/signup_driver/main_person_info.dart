import 'package:country_list_pick/country_list_pick.dart';

import 'package:flutter/material.dart';
import 'package:g_trip/veiw/Auth_veiw/sign_up_driver.dart';
import 'package:g_trip/veiw_model/auth-driver-veiw-model.dart';

import 'package:get/get.dart';

import '../../widgets/bigbutton.dart';

// ignore: must_be_immutable
class MainInfoDriverVeiw extends GetWidget<AuthDriverVeiwModel> {
  MainInfoDriverVeiw({Key? key}) : super(key: key);

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController emailCont = TextEditingController();
  @override
  final controller = Get.put(AuthDriverVeiwModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthDriverVeiwModel>(
        builder: (controller) => SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/selogo.png"),
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
                          'E-mail address',
                          style: TextStyle(
                              fontSize: Get.width * 0.035,
                              fontWeight: FontWeight.w400),
                        ),
                        TextFormField(
                          controller: controller.emailCont,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter name";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.email_outlined),
                              hintText: 'myemail@gmail.com',
                              hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.8),
                                  fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        const Text("FullName"),
                        TextFormField(
                          controller: controller.nameCont,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter name";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.person_outlined),
                              hintText: 'Duran0124r',
                              hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.8),
                                  fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(
                          height: Get.height * 0.015,
                        ),
                        Text(
                          'Phone number',
                          style: TextStyle(
                              fontSize: Get.width * 0.035,
                              fontWeight: FontWeight.w400),
                        ),
                        TextFormField(
                          controller: controller.phoneCont,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter your phone";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
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
                              hintText: '+01',
                              hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.8),
                                  fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(
                          height: Get.height * 0.015,
                        ),
                        const Text("Date Of birth"),
                        TextFormField(
                          controller: controller.dateCont,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter name";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.calendar_month_outlined)),
                              hintText: '2002/22/1',
                              hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.8),
                                  fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        const Text("Residential address"),
                        TextFormField(
                          controller: controller.addresCont,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter name";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              suffixIcon:
                                  const Icon(Icons.location_on_outlined),
                              hintText: 'N°12 Mendela Street',
                              hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.8),
                                  fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(
                          height: Get.height * 0.015,
                        ),
                        const Text("password"),
                        TextFormField(
                          controller: controller.passwordCont,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter name";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.person),
                              hintText: 'pasword',
                              hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.8),
                                  fontWeight: FontWeight.w500)),
                        ),
                        BigButton(
                            txt: 'Next ',
                            ontap: () async {
                              if (_key.currentState!.validate()) {
                                controller.cpage(1);
                                Get.to(() => SignUpDriverVeiw());
                              }
                            }),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

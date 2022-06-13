// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:g_trip/helper/consts.dart';
import 'package:g_trip/veiw/widgets/customtext.dart';
import 'package:g_trip/veiw_model/auth-driver-veiw-model.dart';

import 'package:get/get.dart';

import '../../widgets/bigbutton.dart';

// ignore: must_be_immutable
class ChangeSettingDriverVeiw extends GetWidget<AuthDriverVeiwModel> {
  ChangeSettingDriverVeiw({Key? key}) : super(key: key);

  @override
  final controller = Get.put(AuthDriverVeiwModel());
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<AuthDriverVeiwModel>(
          builder: (controller) => SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Your Charges",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    const Text(
                      "How Much do you charge",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.all(0.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please enter Toyota LV12";
                              }
                              return null;
                            },
                            controller: controller.cpkCont,
                            // controller: ,
                            decoration: InputDecoration(
                              suffixIcon: Column(
                                children: [
                                  (ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Per Km",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(110, 56),
                                        primary: Colors.grey),
                                  )),
                                ],
                              ),
                              // hintText: "email enter",
                              // labelStyle: TextStyle(fontSize: 44),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(2)),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Container(
                            padding: const EdgeInsets.all(3),
                            color: primaryColor,
                            height: Get.height * 0.28,
                            width: 170,
                            child: Column(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Payment",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      "Method",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                          fontSize: 13),
                                    )
                                  ],
                                ),
                                RadioListTile(
                                    activeColor: Colors.white,
                                    subtitle: customText(
                                        txt: 'master',
                                        color: Colors.white,
                                        size: 15),
                                    value: 'master',
                                    groupValue: controller.cat,
                                    onChanged: (value) {
                                      controller.radiost(value.toString());
                                    }),
                                RadioListTile(
                                    activeColor: Colors.white,
                                    title: customText(
                                        txt: 'credit card',
                                        color: Colors.white,
                                        size: 15),
                                    value: 'credit',
                                    groupValue: controller.cat,
                                    onChanged: (value) {
                                      controller.radiost(value.toString());
                                    }),
                                RadioListTile(
                                    activeColor: Colors.white,
                                    title: customText(
                                        txt: 'visa',
                                        color: Colors.white,
                                        size: 15),
                                    value: 'visa',
                                    groupValue: controller.cat,
                                    onChanged: (value) {
                                      controller.radiost(value.toString());
                                    }),
                              ],
                            ),
                          ),
                          const Text("Account Name"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "please enter Toyota LV12";
                                    }
                                    return null;
                                  },
                                  controller: controller.anCont,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.grey.withOpacity(0.3)),
                                    borderRadius: BorderRadius.circular(4),
                                  )),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          const Text("Account num"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Column(
                            children: [
                              Container(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "please enter Toyota LV12";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  controller: controller.anumCont,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.grey.withOpacity(0.3)),
                                    borderRadius: BorderRadius.circular(4),
                                  )),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          const Text("Bank name"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Column(
                            children: [
                              Container(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "please enter Toyota LV12";
                                    }
                                    return null;
                                  },
                                  controller: controller.bnCont,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.grey.withOpacity(0.3)),
                                    borderRadius: BorderRadius.circular(4),
                                  )),
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.05,
                              ),
                              SingleChildScrollView(
                                child: Container(
                                  color: primaryColor,
                                  height: 290,
                                  width: 364,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: const Text(
                                            "Wallet",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(
                                          child: Divider(
                                            color: Colors.white,
                                            thickness: 1.5,
                                            height: 30,
                                          ),
                                        ),
                                        const Text(
                                          "Driver ID",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          color: Colors.white,
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "please enter Toyota LV12";
                                              }
                                              return null;
                                            },
                                            controller: controller.didCont,
                                            decoration: InputDecoration(
                                                hintText: "Joh12VT",
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 2,
                                                      color: Colors.white
                                                          .withOpacity(1)),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.02,
                                        ),
                                        const Text(
                                          "Driver Name",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          color: Colors.white,
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "please enter Toyota LV12";
                                              }
                                              return null;
                                            },
                                            controller: controller.dnameCont,
                                            decoration: InputDecoration(
                                                hintText: "John EIHD",
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 2,
                                                      color: Colors.white
                                                          .withOpacity(1)),
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.02,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              BigButton(
                                  txt: 'Create Account ',
                                  ontap: () async {
                                    if (_key.currentState!.validate()) {
                                      controller.signUp(
                                          controller.emailCont.text,
                                          controller.nameCont.text,
                                          controller.phoneCont.text,
                                          controller.dateCont.text,
                                          controller.addresCont.text,
                                          controller.ctypeCont.text,
                                          controller.cnameCont.text,
                                          controller.cnumCont.text,
                                          controller.cpaperCont.text,
                                          controller.licencesCont.text,
                                          controller.idCont.text,
                                          controller.cpkCont.text,
                                          controller.anCont.text,
                                          controller.anumCont.text,
                                          controller.bnCont.text,
                                          controller.didCont.text,
                                          controller.dnameCont.text,
                                          controller.cat,
                                          controller.passwordCont.text);
                                    }
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

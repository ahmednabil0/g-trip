// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:g_trip/veiw_model/auth-driver-veiw-model.dart';
import '../../widgets/bigbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SecondInfoDriverVeiw extends GetWidget<AuthDriverVeiwModel> {
  SecondInfoDriverVeiw({Key? key}) : super(key: key);

  @override
  final controller = Get.put(AuthDriverVeiwModel());
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

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
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.005,
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
                              Padding(
                                padding: const EdgeInsets.only(right: 250),
                                child: Text(
                                  "Type of car",
                                  style: TextStyle(
                                      fontSize: Get.width * 0.035,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              TextFormField(
                                controller: controller.ctypeCont,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "please enter Main Van";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    suffixIcon: const Icon(Icons.person),
                                    hintText: 'Mini Van',
                                    hintStyle: TextStyle(
                                        color: Colors.grey.withOpacity(0.8),
                                        fontWeight: FontWeight.w500)),
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              const Text("Car Name"),
                              TextFormField(
                                controller: controller.cnameCont,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "please enter Toyota LV12";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    suffixIcon:
                                        const Icon(Icons.car_rental_outlined),
                                    hintText: 'Toyota LV12',
                                    hintStyle: TextStyle(
                                        color: Colors.grey.withOpacity(0.8),
                                        fontWeight: FontWeight.w500)),
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              const Text("Plate Number"),
                              TextFormField(
                                controller: controller.cnumCont,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "please enter 2304 - TNV";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    suffixIcon:
                                        const Icon(Icons.nine_mp_outlined),
                                    hintText: '2304 - TNV',
                                    hintStyle: TextStyle(
                                        color: Colors.grey.withOpacity(0.8),
                                        fontWeight: FontWeight.w500)),
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              const Text("Cars Paper"),
                              TextFormField(
                                textAlign: TextAlign.center,
                                controller: controller.cpaperCont,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "please enter Toyota LV12";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    prefixIcon: Column(
                                      children: [
                                        ElevatedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "Browse",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.grey)),
                                      ],
                                    ),
                                    suffixIcon:
                                        const Icon(Icons.read_more_outlined),
                                    hintText: 'name of the paper file',
                                    // suffix: const Icon(
                                    //   Icons.reply_all_rounded
                                    // ),
                                    hintStyle: TextStyle(
                                        color: Colors.grey.withOpacity(0.8),
                                        fontWeight: FontWeight.w500)),
                              ),
                              const Text(
                                  "only jpeg, jpg, pdf format are accepted and max size is 4MB"),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              const Text("Drivers Licence"),
                              TextFormField(
                                controller: controller.licencesCont,
                                textAlign: TextAlign.center,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "please enter Toyota LV12";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    prefixIcon: Column(
                                      children: [
                                        ElevatedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "Browse",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.grey)),
                                      ],
                                    ),
                                    suffixIcon: const Icon(Icons.person),
                                    hintText: 'name of the paper file',
                                    suffix: const Icon(
                                      Icons.text_fields_outlined,
                                    ),
                                    hintStyle: TextStyle(
                                        color: Colors.grey.withOpacity(0.8),
                                        fontWeight: FontWeight.w500)),
                              ),
                              const Text(
                                  "only jpeg, jpg, pdf format are accepted and max size is 4MB"),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              const Text("ID card / Passport"),
                              TextFormField(
                                controller: controller.idCont,
                                textAlign: TextAlign.center,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "please enter Toyota LV12";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    prefixIcon: Column(
                                      children: [
                                        ElevatedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "Browse",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.grey)),
                                      ],
                                    ),
                                    suffixIcon: const Icon(Icons.person),
                                    hintText: 'name of the paper file',
                                    suffix: const Icon(
                                      Icons.text_fields_outlined,
                                    ),
                                    hintStyle: TextStyle(
                                        color: Colors.grey.withOpacity(0.8),
                                        fontWeight: FontWeight.w500)),
                              ),
                              const Text(
                                  "only jpeg, jpg, pdf format are accepted and max size is 4MB"),
                              BigButton(
                                  txt: 'Next ',
                                  ontap: () async {
                                    if (_key.currentState!.validate()) {
                                      controller.cpage(2);
                                    }
                                  }),
                            ],
                          ),
                        ),
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

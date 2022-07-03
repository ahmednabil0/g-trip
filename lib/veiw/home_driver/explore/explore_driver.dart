// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:g_trip/helper/consts.dart';
import 'package:g_trip/veiw/widgets/bigbutton.dart';
import 'package:g_trip/veiw/widgets/customtext.dart';
import 'package:g_trip/veiw_model/google_veiw_model.dart';
import 'package:get/get.dart';

class ExploreDriverVeiw extends GetWidget<GoogleVeiwModel> {
  ExploreDriverVeiw({Key? key}) : super(key: key);
  @override
  final controller = Get.put(GoogleVeiwModel());
  final Stream<QuerySnapshot> useRef =
      FirebaseFirestore.instance.collection('orders').snapshots();
  String? name;
  String? mpk;
  String? paytype;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey[200],
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Notifications",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                  width: Get.width * 0.9,
                  height: Get.height * 0.75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('orders')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.height * 0.01,
                                vertical: Get.height * 0.01),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot doc = snapshot.data!.docs[index];

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    customText(
                                      color: fontColor,
                                      txt: 'jop for ${doc['type']}',
                                      size: Get.height * 0.025,
                                      fw: FontWeight.bold,
                                    ),
                                    customText(
                                      color: primaryColor,
                                      txt: doc['details'],
                                      size: Get.height * 0.02,
                                    ),
                                    Row(
                                      children: [
                                        customText(
                                          color: primaryColor,
                                          txt: 'distance:',
                                          size: Get.height * 0.025,
                                          fw: FontWeight.bold,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: customText(
                                            color: secondcolor,
                                            txt: doc['destance'],
                                            size: Get.height * 0.02,
                                            fw: FontWeight.bold,
                                          ),
                                        ),
                                        const Spacer(),
                                        BigButton3(
                                            txt: 'Apply',
                                            ontap: () async {
                                              await FirebaseFirestore.instance
                                                  .collection('drivers')
                                                  .doc(FirebaseAuth.instance
                                                      .currentUser!.uid)
                                                  .get()
                                                  .then((value) {
                                                name = value['drivername'];
                                                mpk = value['changesPerKilo'];
                                                paytype =
                                                    value['payment_method'];
                                              });

                                              await FirebaseFirestore.instance
                                                  .collection('orders')
                                                  .doc(doc['uid'])
                                                  .update({
                                                'paytype': paytype,
                                                'changesPerKilo': mpk,
                                                'drivername': name,
                                                'did': FirebaseAuth
                                                    .instance.currentUser!.uid
                                              });
                                            }),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3.0),
                                      child: Divider(
                                        color: fontColor.withOpacity(0.5),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                      } else {
                        return const Text("No data");
                      }
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

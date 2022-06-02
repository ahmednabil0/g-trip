import 'package:flutter/material.dart';
import 'package:g_trip/helper/consts.dart';
import 'package:g_trip/veiw/widgets/customtext.dart';
import 'package:get/get.dart';

class TokenVeiw extends StatelessWidget {
  const TokenVeiw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        Get.width * 0.088,
      ),
      child: Column(
        children: [
          customText(
            color: fontColor,
            txt: 'token Balance',
            size: Get.width * .04,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Get.width * 0.01),
            child: customText(
              color: fontColor,
              txt: '500 token',
              size: Get.width * .078,
              fw: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: Get.width * 0.08,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(5)),
                child: SizedBox(
                  width: Get.width * 0.535,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.credit_card_rounded,
                          size: Get.width * 0.088,
                        ),
                        customText(
                          color: fontColor,
                          txt: ' Upgrade token',
                          size: Get.width * .05,
                          fw: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:all_events_task/modules/login/login_controller.dart';
import 'package:all_events_task/shared/constant/color_constant.dart';
import 'package:all_events_task/shared/constant/image_constatnt.dart';
import 'package:all_events_task/shared/constant/string_constant.dart';
import 'package:all_events_task/shared/utills/math_utills.dart';
import 'package:all_events_task/shared/widgets/base_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(ImageConstants.appLogo),
                height: 300,
                width: 300,
              ),
              SizedBox(height: getSize(20),),
              InkWell(
                onTap: () {
                  controller.signInWithGoogle(context: context);
                  if(controller.isLoading.value == false){
                    CircularProgressIndicator(color: ColorConstants.black);
                  }
                },
                child: Container(
                  height: 50,
                  width: Get.width/1.5,
                  decoration: BoxDecoration(
                    color: ColorConstants.kPrimary,
                    borderRadius: BorderRadius.circular(getSize(25)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: getSize(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(image: AssetImage(ImageConstants.googleLogin2)),
                        SizedBox(
                          width: getSize(10),
                        ),
                        BaseText(
                          text: StringConstant.loginWithGoogle,
                          textColor: ColorConstants.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:all_events_task/modules/categories_listing/listing_binding.dart';
import 'package:all_events_task/modules/categories_listing/listing_view.dart';
import 'package:all_events_task/shared/constant/color_constant.dart';
import 'package:all_events_task/shared/constant/string_constant.dart';
import 'package:all_events_task/shared/utills/math_utills.dart';
import 'package:all_events_task/shared/widgets/base_text.dart';
import 'package:all_events_task/shared/widgets/common_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Hello", isBack: false,isBackButton: false,),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText(
                  text: StringConstant.categories,
                  fontSize: 18,
                  textColor: ColorConstants.kPrimary,
                  fontWeight: FontWeight.w700),
              const Divider(),
              SizedBox(height: getSize(10)),
              Wrap(
                  spacing: getSize(10),
                  runSpacing: getSize(10),
                  children: List.generate(
                      controller.categories.length,
                      (index) => categoriesWidget(
                          name: controller.categories[index].category ?? '',
                          onTap: () {
                            controller.selectedIndex.value = index;
                            if (controller.selectedIndex.value == index) {
                              controller.isValid.value = true;
                            }
                            controller.categories[index].isSelected.value =
                                !controller.categories[index].isSelected.value;
                          },
                          index: index))),
              SizedBox(height: getSize(10)),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    controller.isValid.value
                        ? Get.to(const ListingView(),
                            binding: ListingBinding(),
                            arguments: [
                                controller
                                    .categories[controller.selectedIndex.value]
                                    .data
                              ])
                        : null;
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        controller.isValid.value
                            ? ColorConstants.kPrimary
                            : ColorConstants.grey),
                  ),
                  child: BaseText(
                    text: StringConstant.getEvents,
                    fontSize: 16,
                    textColor: ColorConstants.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  Widget categoriesWidget(
      {required String name,
      required void Function() onTap,
      required int index}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: controller.selectedIndex.value == index
              ? ColorConstants.kPrimary
              : ColorConstants.white,
          border: Border.all(color: ColorConstants.grey),
          borderRadius: BorderRadius.circular(getSize(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BaseText(
            text: name,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

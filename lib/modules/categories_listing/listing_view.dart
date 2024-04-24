import 'package:all_events_task/modules/categories_listing/widget/gridView.dart';
import 'package:all_events_task/modules/categories_listing/widget/listView.dart';
import 'package:all_events_task/shared/constant/color_constant.dart';
import 'package:all_events_task/shared/constant/string_constant.dart';
import 'package:all_events_task/shared/widgets/common_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'listing_controller.dart';

class ListingView extends GetView<ListingController> {
  const ListingView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: BaseAppBar(
          title: StringConstant.categoryListing,
          isBack: true,
          appBarHeight: 100,
          bottom: TabBar(
            indicatorColor: ColorConstants.kPrimary,
            indicatorSize: TabBarIndicatorSize.tab   ,
            tabs: [
              Tab(
                  icon: Icon(
                Icons.menu,
                color: ColorConstants.kPrimary,
              )),
              Tab(
                  icon: Icon(
                Icons.grid_view,
                color: ColorConstants.kPrimary,
              )),
            ],
          ),
        ),
        body: const Column(children: [
          TabBarView(children: [
            ViewForList(
              name: 'name',
              date: 'date',
              venue: 'venue',
              itemCount: 5,
            ),
            ViewForGrid(
              name: 'name',
              date: 'date',
              venue: 'venue',
              itemCount: 5,
            )
          ])
        ]),
      ),
    );
  }
}

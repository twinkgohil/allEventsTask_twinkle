import 'package:all_events_task/shared/constant/color_constant.dart';
import 'package:all_events_task/shared/utills/math_utills.dart';
import 'package:all_events_task/shared/widgets/base_text.dart';
import 'package:flutter/cupertino.dart';

class ViewForList extends StatelessWidget {
  final String name;
  final String date;
  final String venue;
  final int itemCount;
  const ViewForList(
      {super.key, required this.name, required this.date, required this.venue, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return listingWidget(name: '', date: '', venue: '');
      },
    );
  }

  Widget listingWidget(
      {required String name, required String date, required String venue}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.kPrimary.withOpacity(0.4),
          borderRadius: BorderRadius.circular(getSize(20)),
          border: Border.all(color: ColorConstants.grey, width: 1),
        ),
        child: Column(
          children: [
            BaseText(text: "Event name : $name", fontSize: 14),
            BaseText(text: "Date&Time : $date", fontSize: 14),
            BaseText(text: "Venue : $venue", fontSize: 14),
          ],
        ),
      ),
    );
  }
}

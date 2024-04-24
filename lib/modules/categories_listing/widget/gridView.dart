import 'package:all_events_task/shared/constant/color_constant.dart';
import 'package:all_events_task/shared/utills/math_utills.dart';
import 'package:all_events_task/shared/widgets/base_text.dart';
import 'package:flutter/cupertino.dart';

class ViewForGrid extends StatelessWidget {
  final String name;
  final String date;
  final String venue;
  final int itemCount;
  const ViewForGrid(
      {super.key, required this.name, required this.date, required this.venue, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 16),
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return gridWidget(name: '', date: '', venue: '');
      },
    );
  }

  Widget gridWidget(
      {required String name, required String date, required String venue}) {
    return Container(
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
    );
  }
}

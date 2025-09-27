import 'package:evently/core/extensions/date_time_ex.dart';
import 'package:evently/core/resources/Colors_Manger.dart';
import 'package:evently/core/resources/assets_manger.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key, required this.event});

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.only(top: 16.h),
      width: 361.w,
      height: 203.h,
      decoration: BoxDecoration(
        border: Border.all(width: 1.w, color: ColorsManger.blue),
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
            image: AssetImage(
              AssetsManger.sports,
            ),
            fit: BoxFit.fill),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: REdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      event.date.day.toString(),
                      style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsManger.blue),
                    ),
                    Text(
                      event.date.toMonthShortcut,
                      style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsManger.blue),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: REdgeInsets.only(left: 8),
                      child: Text(
                        event.title,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        size: 24.sp,
                        color: ColorsManger.blue,
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

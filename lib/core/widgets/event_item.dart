import 'package:evently/core/extensions/date_time_ex.dart';
import 'package:evently/core/resources/Colors_Manger.dart';
import 'package:evently/core/resources/assets_manger.dart';
import 'package:evently/firebase_service/firebase_service.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EventItem extends StatefulWidget {
  const EventItem(
      {super.key, required this.event, required this.favouriteEvent});

  final EventModel event;
  final bool favouriteEvent;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  late bool isFavourite = widget.favouriteEvent;
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
            image: AssetImage(widget.event.category.imagePath),
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
                      widget.event.date.day.toString(),
                      style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsManger.blue),
                    ),
                    Text(
                      widget.event.date.toMonthShortcut,
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
                        widget.event.title,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: _favouriteIconClicked,
                      icon: Icon(
                        isFavourite ? Icons.favorite : Icons.favorite_outline,
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

  void _favouriteIconClicked() async {
    if (isFavourite) {
      await FireBaseService.removeEventFromFavourites(widget.event);
      isFavourite = false;
    } else {
      await FireBaseService.addEventToFavourites(widget.event);
      isFavourite = true;
    }
    setState(() {});
  }
}

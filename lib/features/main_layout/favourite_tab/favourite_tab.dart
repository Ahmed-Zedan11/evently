import 'package:evently/core/resources/Colors_Manger.dart';
import 'package:evently/core/widgets/event_item.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
              margin: REdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 24.sp,
                      color: ColorsManger.blue,
                    ),
                    hintText: "Search for Event",
                    hintStyle: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorsManger.blue),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsManger.blue)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(color: ColorsManger.blue))),
              )),
          Expanded(
              child: Container(
            margin: REdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
                itemBuilder: (context, index) => EventItem(
                    event: EventModel(
                        time: TimeOfDay.now(),
                        title: "this a birthday party",
                        description: "description",
                        date: DateTime.now(),
                        category: CategoryModel.categoriesWithAll[1])),
                itemCount: 10),
          ))
        ],
      ),
    );
  }
}

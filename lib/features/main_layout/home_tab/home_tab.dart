import 'package:evently/core/resources/Colors_Manger.dart';
import 'package:evently/core/widgets/custom_tab_bar.dart';
import 'package:evently/features/main_layout/home_tab/event_item.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: ColorsManger.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24.r),
                    bottomRight: Radius.circular(24.r))),
            width: double.infinity,
            child: SafeArea(
              bottom: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Back ✨",
                              style: GoogleFonts.inter(
                                  fontSize: 14.sp, color: ColorsManger.white),
                            ),
                            Text(
                              "Ahmed Zedan",
                              style: GoogleFonts.inter(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsManger.white),
                            )
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.light_mode_outlined,
                            size: 24.sp, color: ColorsManger.white),
                        SizedBox(width: 5.w),
                        Card(
                          color: ColorsManger.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "EN",
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 24.sp,
                          color: ColorsManger.white,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "Cairo , Egypt",
                          style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorsManger.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  CustomTabBar(
                    selectedTabBGColor: ColorsManger.white,
                    selectedTabFGColor: ColorsManger.blue,
                    unSelectedTabBGColor: Colors.transparent,
                    unSelectedTabFGColor: ColorsManger.white,
                    categoryType: CategoryModel.categoriesWithAll,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: REdgeInsets.only(bottom: 100),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => EventItem(
                event: EventModel(
                    time: TimeOfDay.now(),
                    title: "this a birthday party",
                    description: "description",
                    date: DateTime.now(),
                    category: CategoryModel.categoriesWithAll[1]),
              ),
              itemCount: 10,
            ),
          )),
        ],
      ),
    );
  }
}

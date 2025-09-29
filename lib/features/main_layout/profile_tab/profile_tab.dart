import 'package:evently/core/resources/Colors_Manger.dart';
import 'package:evently/core/resources/assets_manger.dart';
import 'package:evently/features/main_layout/profile_tab/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: REdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(64.r)),
                color: ColorsManger.blue),
            child: Row(
              children: [
                Container(
                  width: 124.w,
                  height: 124.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(1000.r),
                        bottomRight: Radius.circular(1000.r),
                        bottomLeft: Radius.circular(1000.r),
                      ),
                      image: DecorationImage(
                          image: AssetImage(AssetsManger.route))),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ahmed Zedan",
                      style: GoogleFonts.inter(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsManger.white),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "AhmedZedan@gmail.com",
                      style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorsManger.white),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          CustomDropDown(
              title: "Language",
              option1: "English",
              option2: "عربي",
              displayedDrobDown: "English"),
          CustomDropDown(
              title: "Theme",
              option1: "Light",
              option2: "Dark",
              displayedDrobDown: "Light"),
          Spacer(),
          Padding(
            padding: REdgeInsets.only(bottom: 99),
            child: GestureDetector(
              onTap: () {},
              child: Card(
                color: ColorsManger.red,
                margin: REdgeInsets.symmetric(horizontal: 16, vertical: 27),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r)),
                child: Padding(
                  padding: REdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        size: 24.sp,
                        color: ColorsManger.white,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text("Logout",
                          style: GoogleFonts.inter(
                              fontSize: 20.sp, color: ColorsManger.white))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:evently/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TabItem extends StatelessWidget {
  const TabItem(
      {super.key,
      required this.selectedTabBGColor,
      required this.selectedTabFGColor,
      required this.unSelectedTabBGColor,
      required this.unSelectedTabFGColor,
      required this.isSelected,
      required this.category});

  final Color selectedTabBGColor;
  final Color selectedTabFGColor;
  final Color unSelectedTabBGColor;
  final Color unSelectedTabFGColor;
  final bool isSelected;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: selectedTabBGColor, width: 1.w),
        borderRadius: BorderRadius.circular(46.r),
        color: isSelected ? selectedTabBGColor : unSelectedTabBGColor,
      ),
      child: Row(
        children: [
          Icon(
            category.icon,
            size: 24.sp,
            color: isSelected ? selectedTabFGColor : unSelectedTabFGColor,
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            category.name,
            style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: isSelected ? selectedTabFGColor : unSelectedTabFGColor),
          )
        ],
      ),
    );
  }
}

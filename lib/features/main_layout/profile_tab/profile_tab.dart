import 'package:evently/core/resources/Colors_Manger.dart';
import 'package:evently/core/resources/assets_manger.dart';
import 'package:evently/features/main_layout/profile_tab/custom_drop_down.dart';
import 'package:evently/l10n/generated/app_localizations.dart';
import 'package:evently/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    ConfigProvider configProvider = Provider.of<ConfigProvider>(context);
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
              onChanged: (newLanguage) {
                configProvider.changeLanguage(
                    newLanguage == "English" ? Locale("en") : Locale("ar"));
              },
              title: AppLocalizations.of(context).language,
              option1: "English",
              option2: "عربي",
              displayedDrobDown: configProvider.currentLanguage == Locale("en")
                  ? "English"
                  : "عربي"),
          CustomDropDown(
              onChanged: (newTheme) {
                configProvider.changeTheme(
                    newTheme == AppLocalizations.of(context).light
                        ? ThemeMode.light
                        : ThemeMode.dark);
              },
              title: AppLocalizations.of(context).theme,
              option1: AppLocalizations.of(context).light,
              option2: AppLocalizations.of(context).dark,
              displayedDrobDown: configProvider.currentTheme == ThemeMode.light
                  ? AppLocalizations.of(context).light
                  : AppLocalizations.of(context).dark),
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
                      Text(AppLocalizations.of(context).logout,
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

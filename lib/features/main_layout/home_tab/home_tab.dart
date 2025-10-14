import 'package:evently/core/resources/Colors_Manger.dart';
import 'package:evently/core/widgets/custom_tab_bar.dart';
import 'package:evently/core/widgets/event_item.dart';
import 'package:evently/l10n/generated/app_localizations.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/models/user_model.dart';
import 'package:evently/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    ConfigProvider configProvider = Provider.of<ConfigProvider>(context);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
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
                            AppLocalizations.of(context).welcome_back,
                            style: GoogleFonts.inter(
                                fontSize: 14.sp, color: ColorsManger.white),
                          ),
                          Text(
                            UserModel.currentUser!.name,
                            style: GoogleFonts.inter(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorsManger.white),
                          )
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                            configProvider.currentTheme == ThemeMode.light
                                ? Icons.light_mode_outlined
                                : Icons.dark_mode_outlined,
                            size: 24.sp,
                            color: ColorsManger.white),
                        onPressed: () {
                          configProvider.toggleTheme;
                        },
                      ),
                      SizedBox(width: 5.w),
                      GestureDetector(
                        onTap: () {
                          configProvider.toggleLanguage;
                        },
                        child: Card(
                          color: ColorsManger.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              configProvider.currentLanguage == Locale("en")
                                  ? "EN"
                                  : "AR",
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
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
                  selectedTabBGColor:
                      configProvider.currentTheme == ThemeMode.dark
                          ? ColorsManger.blue
                          : ColorsManger.white,
                  selectedTabFGColor:
                      configProvider.currentTheme == ThemeMode.dark
                          ? ColorsManger.white
                          : ColorsManger.blue,
                  unSelectedTabBGColor: Colors.transparent,
                  unSelectedTabFGColor: ColorsManger.white,
                  categoryType: CategoryModel.categoriesWithAll(context),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: Container(
          margin: REdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            padding: REdgeInsets.only(top: 0, bottom: 100),
            itemBuilder: (context, index) => EventItem(
              event: EventModel(
                  time: TimeOfDay.now(),
                  title: "this a birthday party",
                  description: "description",
                  date: DateTime.now(),
                  category: CategoryModel.categoriesWithAll(context)[1]),
            ),
            itemCount: 10,
          ),
        )),
      ],
    );
  }
}

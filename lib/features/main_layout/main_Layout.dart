import 'package:evently/core/resources/Colors_Manger.dart';
import 'package:evently/features/main_layout/favourite_tab/favourite_tab.dart';
import 'package:evently/features/main_layout/home_tab/home_tab.dart';
import 'package:evently/features/main_layout/map_tab/map_tap.dart';
import 'package:evently/features/main_layout/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    MapTab(),
    FavouriteTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: tabs[currentIndex],
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.all(8),
        shape: CircularNotchedRectangle(),
        notchMargin: 6.w,
        child: BottomNavigationBar(
            onTap: _onItemSelected,
            elevation: 0,
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: ColorsManger.white,
            unselectedItemColor: ColorsManger.white,
            items: [
              BottomNavigationBarItem(
                icon:
                    Icon(currentIndex == 0 ? Icons.home : Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(currentIndex == 1
                      ? Icons.location_on
                      : Icons.location_on_outlined),
                  label: "Map"),
              BottomNavigationBarItem(
                  icon: Icon(currentIndex != 2
                      ? Icons.favorite_outline
                      : Icons.favorite_rounded),
                  label: "Favourite"),
              BottomNavigationBarItem(
                  icon: Icon(
                      currentIndex == 3 ? Icons.person : Icons.person_outline),
                  label: "profile"),
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _onFABPressed,
        elevation: 0,
        backgroundColor: ColorsManger.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(75.r),
            side: BorderSide(color: ColorsManger.white, width: 5.w)),
        child: Icon(
          Icons.add,
          size: 24.sp,
          color: ColorsManger.white,
        ),
      ),
    );
  }

  void _onItemSelected(int index) {
    currentIndex = index;
    setState(() {});
  }

  void _onFABPressed() {}
}

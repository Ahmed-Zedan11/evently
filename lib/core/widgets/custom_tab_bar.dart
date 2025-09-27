import 'package:evently/core/widgets/tab_item.dart';
import 'package:evently/models/category_model.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar(
      {super.key,
      required this.selectedTabBGColor,
      required this.selectedTabFGColor,
      required this.unSelectedTabBGColor,
      required this.unSelectedTabFGColor,
      required this.categoryType});

  final Color selectedTabBGColor;
  final Color selectedTabFGColor;
  final Color unSelectedTabBGColor;
  final Color unSelectedTabFGColor;
  final List<CategoryModel> categoryType;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.categoryType.length,
        child: TabBar(
            onTap: _onTapItemPress,
            indicatorColor: Colors.transparent,
            padding: EdgeInsets.zero,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: widget.categoryType
                .map((category) => TabItem(
                      selectedTabBGColor: widget.selectedTabBGColor,
                      selectedTabFGColor: widget.selectedTabFGColor,
                      unSelectedTabBGColor: widget.unSelectedTabBGColor,
                      unSelectedTabFGColor: widget.unSelectedTabFGColor,
                      isSelected: selectedIndex ==
                          widget.categoryType.indexOf(category),
                      category: category,
                    ))
                .toList()));
  }

  void _onTapItemPress(int index) {
    selectedIndex = index;
    setState(() {});
  }
}

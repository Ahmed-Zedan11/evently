import 'package:evently/core/resources/assets_manger.dart';
import 'package:evently/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String name;
  IconData icon;
  String imagePath;

  CategoryModel({
    required this.id,
    required this.icon,
    required this.name,
    required this.imagePath,
  });

  static List<CategoryModel> categoriesWithAll(BuildContext context) {
    return [
      CategoryModel(
          id: "0",
          icon: Icons.all_inbox_rounded,
          name: AppLocalizations.of(context).all,
          imagePath: ""),
      CategoryModel(
          id: "1",
          icon: Icons.sports,
          name: AppLocalizations.of(context).sport,
          imagePath: ""),
      CategoryModel(
          id: "2",
          icon: Icons.cake_rounded,
          name: AppLocalizations.of(context).birthday,
          imagePath: ""),
      CategoryModel(
          id: "3",
          icon: Icons.meeting_room_rounded,
          name: AppLocalizations.of(context).meeting,
          imagePath: ""),
      CategoryModel(
          id: "4",
          icon: Icons.gamepad_rounded,
          name: AppLocalizations.of(context).gaming,
          imagePath: ""),
      CategoryModel(
          id: "5",
          icon: Icons.food_bank_rounded,
          name: AppLocalizations.of(context).eating,
          imagePath: ""),
      CategoryModel(
          id: "6",
          icon: Icons.holiday_village_rounded,
          name: AppLocalizations.of(context).holiday,
          imagePath: ""),
      CategoryModel(
          id: "7",
          icon: Icons.water_drop_sharp,
          name: AppLocalizations.of(context).exhibition,
          imagePath: ""),
      CategoryModel(
          id: "8",
          icon: Icons.workspaces_filled,
          name: AppLocalizations.of(context).work_shop,
          imagePath: ""),
      CategoryModel(
          id: "9",
          icon: Icons.book,
          name: AppLocalizations.of(context).book_shop,
          imagePath: ""),
    ];
  }

  static List<CategoryModel> categoriesWithoutAll(BuildContext context) {
    return [
      CategoryModel(
          id: "1",
          icon: Icons.sports,
          name: AppLocalizations.of(context).sport,
          imagePath: AssetsManger.sports),
      CategoryModel(
          id: "2",
          icon: Icons.cake_rounded,
          name: AppLocalizations.of(context).birthday,
          imagePath: AssetsManger.birthDay),
      CategoryModel(
          id: "3",
          icon: Icons.meeting_room_rounded,
          name: AppLocalizations.of(context).meeting,
          imagePath: AssetsManger.meeting),
      CategoryModel(
          id: "4",
          icon: Icons.gamepad_rounded,
          name: AppLocalizations.of(context).gaming,
          imagePath: AssetsManger.gaming),
      CategoryModel(
          id: "5",
          icon: Icons.food_bank_rounded,
          name: AppLocalizations.of(context).eating,
          imagePath: AssetsManger.eating),
      CategoryModel(
          id: "6",
          icon: Icons.holiday_village_rounded,
          name: AppLocalizations.of(context).holiday,
          imagePath: AssetsManger.holiday),
      CategoryModel(
          id: "7",
          icon: Icons.water_drop_sharp,
          name: AppLocalizations.of(context).exhibition,
          imagePath: AssetsManger.exhibition),
      CategoryModel(
          id: "8",
          icon: Icons.workspaces_filled,
          name: AppLocalizations.of(context).work_shop,
          imagePath: AssetsManger.workShop),
      CategoryModel(
          id: "9",
          icon: Icons.book,
          name: AppLocalizations.of(context).book_shop,
          imagePath: AssetsManger.bookClub),
    ];
  }
}

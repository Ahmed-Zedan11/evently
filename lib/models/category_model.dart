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

  static List<CategoryModel> categoriesWithAll = [
    CategoryModel(
        id: "0", icon: Icons.all_inbox_rounded, name: "All", imagePath: ""),
    CategoryModel(id: "1", icon: Icons.sports, name: "Sports", imagePath: ""),
    CategoryModel(
        id: "2", icon: Icons.cake_rounded, name: "Birth Day", imagePath: ""),
    CategoryModel(
        id: "3",
        icon: Icons.meeting_room_rounded,
        name: "Meeting",
        imagePath: ""),
    CategoryModel(
        id: "4", icon: Icons.gamepad_rounded, name: "Gaming", imagePath: ""),
    CategoryModel(
        id: "5", icon: Icons.food_bank_rounded, name: "Eating", imagePath: ""),
    CategoryModel(
        id: "6",
        icon: Icons.holiday_village_rounded,
        name: "Holiday",
        imagePath: ""),
    CategoryModel(
        id: "7",
        icon: Icons.water_drop_sharp,
        name: "Exhibition",
        imagePath: ""),
    CategoryModel(
        id: "8",
        icon: Icons.workspaces_filled,
        name: "Work Shop",
        imagePath: ""),
    CategoryModel(id: "9", icon: Icons.book, name: "Books Shop", imagePath: ""),
  ];

  static List<CategoryModel> categoriesWithoutAll = [
    CategoryModel(id: "1", icon: Icons.sports, name: "Sports", imagePath: ""),
    CategoryModel(
        id: "2", icon: Icons.cake_rounded, name: "Birth Day", imagePath: ""),
    CategoryModel(
        id: "3",
        icon: Icons.meeting_room_rounded,
        name: "Meeting",
        imagePath: ""),
    CategoryModel(
        id: "4", icon: Icons.gamepad_rounded, name: "Gaming", imagePath: ""),
    CategoryModel(
        id: "5", icon: Icons.food_bank_rounded, name: "Eating", imagePath: ""),
    CategoryModel(
        id: "6",
        icon: Icons.holiday_village_rounded,
        name: "Holiday",
        imagePath: ""),
    CategoryModel(
        id: "7",
        icon: Icons.water_drop_sharp,
        name: "Exhibition",
        imagePath: ""),
    CategoryModel(
        id: "8",
        icon: Icons.workspaces_filled,
        name: "Work Shop",
        imagePath: ""),
    CategoryModel(id: "9", icon: Icons.book, name: "Books Shop", imagePath: ""),
  ];
}

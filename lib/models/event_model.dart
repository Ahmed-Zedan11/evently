import 'package:evently/models/category_model.dart';
import 'package:flutter/material.dart';

class EventModel {
  final String title;
  final String description;
  final DateTime date;
  String eventId;
  final String userId;
  final CategoryModel category;

  EventModel({
    required this.eventId,
    required this.userId,
    required this.title,
    required this.description,
    required this.date,
    required this.category,
  });

  EventModel.fromjson(Map<String, dynamic> json, BuildContext context)
      : this(
          eventId: json["eventId"],
          userId: json["userId"],
          title: json["title"],
          description: json["description"],
          date: json["date"].toDate(),
          category: CategoryModel.categoriesWithoutAll(context)
              .firstWhere((category) => json["categoryId"] == category.id),
        );

  Map<String, dynamic> tojson() => {
        "eventId": eventId,
        "userId": userId,
        "title": title,
        "description": description,
        "date": date,
        "categoryId": category.id
      };
}

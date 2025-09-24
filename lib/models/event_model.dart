import 'package:evently/models/category_model.dart';
import 'package:flutter/material.dart';

class EventModel {
  final String title;
  final String description;
  final DateTime date;
  final TimeOfDay time;
  final CategoryModel category;

  EventModel({
    required this.time,
    required this.title,
    required this.description,
    required this.date,
    required this.category,
  });
}

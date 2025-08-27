import 'package:flutter/material.dart';

class CategoryModel {
  final String image;
  final String title;
  final Widget destinationPage;

  const CategoryModel({
    required this.image,
    required this.title,
    required this.destinationPage,
  });
}
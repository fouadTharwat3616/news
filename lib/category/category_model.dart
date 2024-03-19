import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String title;
  final String imageName;
  final Color color;

  CategoryModel({
    required this.id,
    required this.title,
    required this.imageName,
    required this.color,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      id: 'business',
      title: 'Business',
      imageName: 'bussines',
      color: const Color(0xFFCF7E48),
    ),
    CategoryModel(
      id: 'entertainment',
      title: 'Entertainment',
      imageName: 'environment',
      color: const Color(0xFF4882CF),
    ),
    CategoryModel(
      id: 'sports',
      title: 'Sports',
      imageName: 'ball',
      color: const Color(0xFFC91C22),
    ),
    CategoryModel(
      id: 'science',
      title: 'Science',
      imageName: 'science',
      color: const Color(0xFFF2D352),
    ),
    CategoryModel(
      id: 'sports',
      title: 'Sports',
      imageName: 'ball',
      color: const Color(0xFFC91C22),
    ),
    CategoryModel(
      id: 'science',
      title: 'Science',
      imageName: 'science',
      color: const Color(0xFFF2D352),
    ),
  ];
}

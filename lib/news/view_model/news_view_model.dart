import 'package:flutter/material.dart';
import 'package:news/news/data/data_source/news_api_data_source.dart';
import 'package:news/news/data/models/news.dart';

class NewsViewModel with ChangeNotifier {
  final NewsAPIDataSource apiDataSource = NewsAPIDataSource();

  List<News> newsList = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getNews(String sourceId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await apiDataSource.getNews(sourceId);
      if (response.status == 'ok') {
        newsList = response.news ?? [];
      } else {
        errorMessage = 'Failed to get news';
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}

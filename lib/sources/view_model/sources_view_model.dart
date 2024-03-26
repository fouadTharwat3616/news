import 'package:flutter/material.dart';
import 'package:news/sources/data/data_source/sources_api_data_source.dart';
import 'package:news/sources/data/models/source.dart';

class SourcesViewModel with ChangeNotifier {
  final SourcesAPIDataSource apiDataSource = SourcesAPIDataSource();

  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await apiDataSource.getSources(categoryId);
      if (response.status == 'ok') {
        sources = response.sources ?? [];
      } else {
        errorMessage = 'Failed to get sources';
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}

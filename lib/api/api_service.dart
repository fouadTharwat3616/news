import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/models/news_response/news_response.dart';
import 'package:news/models/sources_response/sources_response.dart';

class APIService {
  static Future<SourcesResponse> getSources(String categoryId) async {
    try {
      final uri = Uri.https(
        APIConstants.baseUrl,
        APIConstants.sourcesEndpoint,
        {
          'apiKey': APIConstants.apiKey,
          'category': categoryId,
        },
      );
      final response = await http.get(uri);
      final json = jsonDecode(response.body);
      return SourcesResponse.fromJson(json);
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    try {
      final uri = Uri.https(
        APIConstants.baseUrl,
        APIConstants.newsEndpoint,
        {
          'apiKey': APIConstants.apiKey,
          'sources': sourceId,
        },
      );
      final response = await http.get(uri);
      final json = jsonDecode(response.body);
      return NewsResponse.fromJson(json);
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}

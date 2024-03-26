import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/shared/api_constants.dart';
import 'package:news/news/data/models/news_response.dart';

class NewsAPIDataSource {
  Future<NewsResponse> getNews(String sourceId) async {
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
  }
}

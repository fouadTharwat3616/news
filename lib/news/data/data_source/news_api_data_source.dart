import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/news/data/data_source/news_data_source.dart';
import 'package:news/news/data/models/news.dart';
import 'package:news/shared/api_constants.dart';
import 'package:news/news/data/models/news_response.dart';

class NewsAPIDataSource extends NewsDataSource {
  @override
  Future<List<News>> getNews(String sourceId) async {
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
    final newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.status == 'ok' && newsResponse.news != null) {
      return newsResponse.news!;
    } else {
      throw Exception('Failed to get news!');
    }
  }
}

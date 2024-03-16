import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/sources_response/sources_response.dart';

class APIService {
  static Future<SourcesResponse> getSources(String category) async {
    try {
      final uri = Uri.https(
        'newsapi.org',
        '/v2/top-headlines/sources',
        {
          'apiKey': 'd5e9bde5d9bb4e3392afe4d1449a8be6',
          'category': category,
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
}

import 'dart:convert';

import 'package:news/shared/api_constants.dart';
import 'package:news/sources/data/models/sources_response.dart';
import 'package:http/http.dart' as http;

class SourcesAPIDataSource {
  Future<SourcesResponse> getSources(String categoryId) async {
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
  }
}

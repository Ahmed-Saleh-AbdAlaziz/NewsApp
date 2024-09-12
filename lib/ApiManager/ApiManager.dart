import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/ApiManager/api_constantes.dart';
import 'package:news_app/model/News_Respons.dart';
import 'package:news_app/model/sourceResponse.dart';

class ApiManager {
//https://newsapi.org/v2/top-headlines/sources?apiKey=f0e2fc79a44a4eed8002e91089930959
  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstatnts.baseUrl, ApiConstatnts.sourcesApi, {
      'apiKey': 'f0e2fc79a44a4eed8002e91089930959',
      'category': categoryId,
      'searchIn': ''
    });
    var response = await http.get(url);
    try {
      return SourceResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

//https://newsapi.org/v2/everything?q=bitcoin&apiKey=f0e2fc79a44a4eed8002e91089930959
  static Future<NewsResponse> getBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstatnts.baseUrl, ApiConstatnts.newsApi, {
      'apiKey': 'f0e2fc79a44a4eed8002e91089930959',
      'sources': sourceId,
    });
    var response = await http.get(url);
    try {
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
}

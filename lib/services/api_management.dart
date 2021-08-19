import 'package:http/http.dart' as http;
import 'package:news_app/constants/strings.dart';
import 'dart:convert';

import 'package:news_app/models/newsinfo.dart';

class ApiManagement {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel = null;

    // client.get(Strings.news_url);
    try {
      var url = Uri.parse(Strings.news_url);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        var newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/constants/strings.dart';
import 'package:news_app/models/newsinfo.dart';

class ApiManagement {
  Future<NewsModel> getNews() async {
    // var client = http.Client();
    var newsModel;

    // client.get(Strings.news_url);
    try {
      var url = Uri.parse(Strings.newsUrl);
      var response = await http.get(url);
      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        print('JsonMAP: $jsonMap');
        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}

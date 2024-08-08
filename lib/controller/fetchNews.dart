// ignore_for_file: file_names, unnecessary_new, avoid_print

import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:newsapp/model/newsArt.dart';

class FetchNews {
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];

  static Future<NewsArt> fetchNews() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _random = new Random();
    var sourceID = sourcesId[_random.nextInt(sourcesId.length)];
    print(sourceID);

    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=73f20f4c6c024e0c974c76068094d467"));
    // ignore: non_constant_identifier_names
    Map body_data = jsonDecode(response.body);
    List articles = body_data['articles'];
    // print(articles);

    var myarticles = articles[_random.nextInt(articles.length)];
    print(myarticles);
    print("************************************************");

    return NewsArt.fromAPItoAPP(myarticles);
  }
}

// ignore: file_names
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:taza_khabar/Model/news_artical.dart';

class FetchNews {
  static List<String> sourcesId = [
    "abc-news", "bbc-news", "bbc-sport", "business-insider", "entertainment-weekly",
    "espn", "espn-cric-info", "financial-post","globo","google-news-in", "medical-news-today","new-scientist", "next-big-future", "techradar",
    "the-hindu",];

  static Future<NewsArt> fetchNews() async {
    final _random = new Random();
    var sourceID = sourcesId[_random.nextInt(sourcesId.length)];
   
    Response response = await get(Uri.parse(
       "https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=YOUR API KEY FROM NEWSAPI"));
           
    Map body_data = jsonDecode(response.body);
    List articles = body_data["articles"];
  
    final _Newrandom =  Random();
    var myArticle = articles[_random.nextInt(articles.length)];
 

    return NewsArt.fromAPItoApp(myArticle);
  }
}

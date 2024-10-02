 import 'package:flutter/material.dart';
import 'package:taza_khabar/controller/fatchNews.dart';
  
  import 'package:taza_khabar/Model/news_artical.dart';
import 'package:taza_khabar/view/widgets/NewsContainer.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;

  late NewsArt newsArt;

  GetNews() async {
    newsArt = await FetchNews.fetchNews();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    GetNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    
      body: PageView.builder(
          controller: PageController(initialPage: 0),
          scrollDirection: Axis.vertical,
          onPageChanged: (value) {
            setState(() {
              isLoading = true;
            });
            GetNews();
          },
          itemBuilder: (context, index) {
            return isLoading ? const Center(child: CircularProgressIndicator(),) : NewsContainer(
                imageUrl: newsArt.imageUrl,
                newscnt: newsArt.cnt,
                newsHeading: newsArt.newsHeading,
                newsDes: newsArt.newsDes,
                newsUrl: newsArt.newsUrl);
          }),
    );
  }
}
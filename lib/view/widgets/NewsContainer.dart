// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:taza_khabar/view/detail_view.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsContainer extends StatelessWidget {
  final String imageUrl;
  final String newsHeading;
  final String newsDes;
  final String newscnt;
  final String newsUrl;

  const NewsContainer({
    super.key,
    required this.imageUrl,
    required this.newsHeading,
    required this.newsDes,
    required this.newscnt,
    required this.newsUrl,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Use one image widget
            FadeInImage.assetNetwork(
              height: 400,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              placeholder: "lib/assets/10295597.jpg",
              image: imageUrl),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    newsHeading.length > 90
                        ? "${newsHeading.substring(0, 90)}...."
                        : newsHeading,
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    newsDes,
                    style: const TextStyle(fontSize: 12, color: Colors.black38),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    newscnt != "--"
                        ? (newscnt.length > 250
                            ? "${newscnt.substring(0, 250)}...."
                            : newscnt)
                        : newscnt,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30), // Replace Spacer() with SizedBox
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) =>
                              Detail_view(newsUrl: newsUrl)),
                        ),
                      );
                    },
                    child:  const Text("Read More",

                    overflow: TextOverflow.ellipsis,
                    
                    ),
                    
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  Uri url = Uri.parse("https://newsapi.org/");
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: const Text(
                  "News Generated By NewsAPI.Org",
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            
          ]
        )
      );
  }
}

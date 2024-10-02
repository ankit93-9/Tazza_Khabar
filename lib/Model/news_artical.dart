// ignore: file_names
class NewsArt{
  
     String imageUrl ;        // Data Modling - Aisi method create krna jis se data frontend se backend me pass kr skte hai 
     String newsHeading;
     String newsDes;
     String cnt ;
     String newsUrl;

       NewsArt({ required this.imageUrl,
    required this.newsHeading,
    required this.newsDes,
    required this.cnt,
    required this.newsUrl,});

         static NewsArt fromAPItoApp(Map <String , dynamic> artical ){
                     return NewsArt(
                     imageUrl: artical["urlToImage"] ?? "https://as2.ftcdn.net/v2/jpg/03/13/59/87/1000_F_313598786_qfT2oTVItHD44pbBsMgjncPf8OuB0Osg.jpg",
                      cnt: artical["content"] ?? "--",
                      newsDes: artical["description"] ?? "--",
                      newsHeading: artical["title"]  ?? "--",
                     newsUrl: artical["url"] ?? "https://news.google.com/topstories?hl=en-IN&gl=IN&ceid=IN:en");
         }
}
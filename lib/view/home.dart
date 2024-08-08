import 'package:flutter/material.dart';
import 'package:newsapp/controller/fetchNews.dart';
import 'package:newsapp/model/newsArt.dart';
import 'package:newsapp/view/widgets/news_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isloading = true;
  late NewsArt newsArt;
  GetNews() async {
    newsArt = await FetchNews.fetchNews();
    setState(() {
      isloading = false;
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
          scrollDirection: Axis.vertical,
          onPageChanged: (value) {
            setState(() {
              isloading = true;
            });
            GetNews();
          },
          controller: PageController(initialPage: 1),
          itemCount: 32,
          itemBuilder: (context, index) {
            return isloading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : NewsContainer(
                    newsCNT: newsArt.newscontent,
                    imageurl: newsArt.imgurl,
                    newsUrl: newsArt.newsUrl,
                    newshead: newsArt.newsHead,
                    newsDesc: newsArt.newsDesc);
          }),
    );
  }
}

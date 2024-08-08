import 'package:flutter/material.dart';
import 'package:newsapp/view/detail_view.dart';

class NewsContainer extends StatelessWidget {
  String imageurl;
  String newshead;
  String newsDesc;
  String newsUrl;
  String newsCNT;
  NewsContainer(
      {super.key,
      required this.newsDesc,
      required this.imageurl,
      required this.newsUrl,
      required this.newshead,
      required this.newsCNT});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.assetNetwork(
              height: 400,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              placeholder: "ASSESTS/IMAGES/istockphoto-1369150014-612x612.jpg",
              image: imageurl),
          const SizedBox(
            height: 10,
          ),
          Text(
              newshead.length > 70
                  ? "${newshead.substring(0, 50)}..."
                  : newshead,
              style:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(children: [
              Text(
                newsDesc,
                style: const TextStyle(fontSize: 12, color: Colors.amber),
              ),
              const SizedBox(height: 10),
              Text(
                newsCNT != "--"
                    ? newsCNT.length > 250
                        ? newsCNT.substring(0, 250)
                        : "${newsCNT.toString().substring(0, newsCNT.length - 15)}..."
                    : newsCNT,
                style: const TextStyle(fontSize: 15, color: Colors.blue),
              )
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailVIewScreen(newsurl: newsUrl)));
                    },
                    child: const Text("Read More")),
              ),
            ],
          )
        ],
      ),
    );
  }
}

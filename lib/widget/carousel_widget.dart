import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/screen/detailpage.dart';
import 'package:news_app/utility/utils.dart';

class CarouselWidget extends StatefulWidget {
  final List<Article> articleList;

  const CarouselWidget({Key? key, required this.articleList}) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late List<Widget> imagesSlider;

  @override
  void initState() {
    imagesSlider = widget.articleList
        .map((article) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailPageScreen(article: article)));
              },
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(article.urlToImage))),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: const [
                              0.1,
                              0.9
                            ],
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.black.withOpacity(0.1),
                            ]),
                      ),
                    ),
                    Positioned(
                        bottom: 30,
                        child: Container(
                            child: Container(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          width: 250.0,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.title,
                                  style: titleArticleHeadline.copyWith(
                                      fontSize: 12.0),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  article.author,
                                  style: authorDateArticle.copyWith(
                                      fontSize: 10.0,
                                      color: Colors.white.withOpacity(0.5)),
                                ),
                              ]),
                        )))
                  ],
                ),
              ),
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: imagesSlider,
        options: CarouselOptions(autoPlay: true, viewportFraction: 1));
  }
}

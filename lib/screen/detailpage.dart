import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/utility/utils.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailPageScreen extends StatefulWidget {
  final Article article;
  const DetailPageScreen({Key? key, required this.article}) : super(key: key);

  @override
  State<DetailPageScreen> createState() => _DetailPageScreenState();
}

class _DetailPageScreenState extends State<DetailPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Image.network(
            widget.article.urlToImage,
            height: 350.0,
            fit: BoxFit.cover,
          ),
          ListView(
            children: [
              const SizedBox(
                height: 350.0,
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.0)),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        widget.article.title,
                        style: titleArticle.copyWith(fontSize: 18.0),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_today_outlined,
                                size: 14.0,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                // widget.article.author.substring(0, 6),
                                widget.article.author,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: authorDateArticle.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                time(
                                    DateTime.parse(widget.article.publishedAt)),
                                style:
                                    authorDateArticle.copyWith(fontSize: 14.0),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const Icon(
                                Icons.account_circle,
                                size: 24.0,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(widget.article.content,
                          textAlign: TextAlign.left,
                          style: detailArticle.copyWith(fontSize: 12.0))
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(0, 10.0),
                            blurRadius: 50.0)
                      ]),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(0.0, 10.0),
                            blurRadius: 50.0),
                      ]),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_rounded),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }

  String time(DateTime parse) {
    return timeago.format(parse, allowFromNow: true, locale: ('id'));
  }
}

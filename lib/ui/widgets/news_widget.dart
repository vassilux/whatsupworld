import 'package:flutter/material.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsupworld/config/palette.dart';
import 'package:whatsupworld/model/news.dart';
import 'package:whatsupworld/ui/widgets/y_margin_widget.dart';

class NewsWidget extends StatelessWidget {
  final Article articleItem;

  const NewsWidget({Key key, @required this.articleItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(context).wp;
    final Function hp = Screen(context).hp;
    return InkWell(
        onTap: () async {
          if (await canLaunch(articleItem.url))
            await launch(
              articleItem.url,
              forceSafariVC: true,
              forceWebView: true,
            );
        },
        child: Container(          
          width: wp(90),
          height: hp(20),
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.only(left: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Palette.appColorBlue, //.grey.withOpacity(0.09),
                  blurRadius: 20,
                  spreadRadius: 3.5,
                  offset: Offset(0, 13)),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 100,
                      margin: EdgeInsets.all(15),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color:  Palette.appColorBlue.withOpacity(0.91),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        articleItem?.author ?? "Source unconnu" ,
                        style: TextStyle(
                              color: Colors.white, fontSize: 13
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            articleItem?.title ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                    color: Color(0xff243358),
                                    fontWeight: FontWeight.bold,
                                fontSize: 12)
                          ),
                          YMarginWidget(5),
                          Text(
                            articleItem?.publishedAt ?? "",
                            style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w200
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Flexible(
                flex: 4,
                child: Container(
                  height: hp(20), 
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      image: articleItem.urlToImage != null
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(articleItem.urlToImage))
                          : null),
                ),
              )
            ],
          ),
        ));
  }
}
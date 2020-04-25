import 'package:flutter/material.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:whatsupworld/config/palette.dart';
import 'package:whatsupworld/model/webcam.dart';
import 'package:whatsupworld/ui/widgets/y_margin_widget.dart';
import 'package:whatsupworld/utils/uidata.dart';
import 'package:whatsupworld/ui/pages/webcam_player_page.dart';

class WebCamItemWidget extends StatelessWidget {
  final Webcam webcam;

  WebCamItemWidget({
    Key key,
    this.webcam,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(context).wp;
    final Function hp = Screen(context).hp;
    return InkWell(
      onTap: () async {
        /*if (await canLaunch(webcam.url))
            await launch(
              articleItem.url,
              forceSafariVC: true,
              forceWebView: true,
            );*/
            print(" open webcam ${webcam.url}");
            Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebcamPlayerPage(webcam),        
      ),
    );

      },
      child: Container(
        width: wp(90),
        height: hp(13),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(webcam?.city ?? "Source unconnu",
                style: UIData.h3Style.copyWith(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
            )),
            YMarginWidget(10),
            Text(webcam?.country ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: UIData.h5Style.copyWith(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    )),
          ],
        ),
      ),
      //Spacer(),
      /* Flexible(
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
              )*/
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:whatsupworld/config/palette.dart';
import 'package:whatsupworld/model/currency.dart';
import 'package:whatsupworld/utils/uidata.dart';

class CurrencyRateWidget extends StatelessWidget {
  final Rate rate;

  const CurrencyRateWidget({
    Key key,
    this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(context).wp;
    final Function hp = Screen(context).hp;

    return Container(
        width: wp(90),
        height: hp(12),
        margin: EdgeInsets.only(bottom: 5),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ListTile(
                leading: Image.network(
                    "https://www.xe.com/themes/xe/images/flags/big/${rate.countryId.toLowerCase()}.png"), //Icon(Icons.album, size: 70),

                title: Text(rate.countryId,
                    style: UIData.h1Style.copyWith(
                      color: Palette.appColorBlue,
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: Text(rate.rate.toString(),
                    style: UIData.h3Style.copyWith(
                      color: Palette.appColorBlue,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              new Padding(padding: new EdgeInsets.all(1.0)),
            ]));
  }
}

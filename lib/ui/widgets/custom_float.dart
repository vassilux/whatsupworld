import 'package:flutter/material.dart';
import 'package:whatsupworld/config/palette.dart';
import 'package:whatsupworld/utils/uidata.dart';


class CustomFloat extends StatelessWidget {
  final IconData icon;
  final Widget builder;
  final VoidCallback qrCallback;
  final isMini;

  CustomFloat({this.icon, this.builder, this.qrCallback, this.isMini = false});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      clipBehavior: Clip.antiAlias,
      mini: isMini,
      onPressed: qrCallback,
      backgroundColor: Palette.appColorBlue,
      child: Ink(
        decoration: new BoxDecoration(),
            //gradient: new LinearGradient(colors: UIData.kitGradients2)),
            
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            builder != null
                ? Positioned(
                    right: 7.0,
                    top: 7.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: builder,
                      radius: 10.0,
                    ),
                  )
                : Container(),
            // builder
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:whatsupworld/model/menu.dart';
import 'package:whatsupworld/utils/uidata.dart';


class MenuViewModel {
  List<Menu> menuItems;

  MenuViewModel({this.menuItems});

  getMenuItems() {
    
    return menuItems = <Menu>[
     
      Menu(
          title: "currency",
          menuColor: Color(0xff261d33),
          icon: Icons.euro_symbol,
          image: UIData.dashboardImage,
          items: ["Currency"]),
      Menu(
          title: "news",
          menuColor: Color(0xff261d33),
          icon: Icons.new_releases,
          image: UIData.dashboardImage,
          items: ["News"]),
      Menu(
          title: "weather",
          menuColor: Color(0xff261d33),
          icon: Icons.access_alarm,
          image: UIData.dashboardImage,
          items: ["Weather"]),

          Menu(
          title: "webcams",
          menuColor: Color(0xff261d33),
          icon: Icons.camera,
          image: UIData.dashboardImage,
          items: ["Webcams"]),

      Menu(
          title: "settings",
          menuColor: Color(0xff2a8ccf),
          icon: Icons.settings,
          image: UIData.settingsImage,
          items: ["Settings"]),
     
    ];
  }
}

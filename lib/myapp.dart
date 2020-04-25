import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsupworld/config/palette.dart';
import 'package:whatsupworld/ui/pages/home_page.dart';
import 'package:whatsupworld/ui/pages/news_page.dart';
import 'package:whatsupworld/ui/pages/not_found_page.dart';
import 'package:whatsupworld/ui/pages/settings_page.dart';
import 'package:whatsupworld/ui/pages/weather_page.dart';
import 'package:whatsupworld/ui/pages/currency_exchange_page.dart';
import 'package:whatsupworld/ui/pages/webcams_page.dart';
import 'package:whatsupworld/utils/translations.dart';
import 'package:whatsupworld/utils/uidata.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: UIData.appName,
        theme: ThemeData(
            primaryColor: Palette.appColorBlue, //Colors.black,
            fontFamily: UIData.quickFont,
            accentColor: Palette.appColorBlue,
            primarySwatch: Colors.amber),
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        home: HomePage(),
        localizationsDelegates: [         
          const TranslationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: allTranslations.supportedLocales(),

        //routes
        routes: <String, WidgetBuilder>{
          UIData.homeRoute: (BuildContext context) => HomePage(),
          UIData.currencyRoute: (BuildContext context) =>
              CurrencyExchangePage(),
          UIData.newsRoute: (BuildContext context) => NewsPage(),
          UIData.weatherRoute: (BuildContext context) => WeatherPage(),
          UIData.settingsRoute: (BuildContext context) => SettingsPage(),
          UIData.webCamsRoute: (BuildContext context) => WebcamsPage(),
        },
        onUnknownRoute: (RouteSettings rs) => new MaterialPageRoute(
            builder: (context) => new NotFoundPage(
                  appTitle: UIData.coming_soon,
                  icon: FontAwesomeIcons.solidSmile,
                  title: UIData.coming_soon,
                  message: "Under Development",
                  iconColor: Colors.green,
                )));
  }

  @override
  void initState() {
    super.initState();     
    allTranslations.onLocaleChangedCallback = _onLocaleChanged;

  }

  setLocale(Locale locale) {
   setState(() {
      //_locale = locale;
  });
}

  _onLocaleChanged() async {
    // do anything you need to do if the language changes
    print('Language has been changed to: ${allTranslations.currentLanguage}');  
    setLocale(allTranslations.locale)  ;
    
  }
}
/*

class MyApp extends StatelessWidget {
  MyApp() {
    //print("MyApp ctor");
    //applic.onLocaleChanged = _onLocaleChanged();
  }

  final materialApp = MaterialApp(
      title: UIData.appName,
      theme: ThemeData(
          primaryColor: Palette.appColorBlue, //Colors.black,
          fontFamily: UIData.quickFont,
          accentColor: Palette.appColorBlue,
          primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      home: HomePage(),
      localizationsDelegates: [
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("en", "US"),
        const Locale("fr", "FR"),
      ],
      // initialRoute: UIData.notFoundRoute,

      //routes
      routes: <String, WidgetBuilder>{
        UIData.homeRoute: (BuildContext context) => HomePage(),
        UIData.currencyRoute: (BuildContext context) => CurrencyExchangePage(),
        UIData.newsRoute: (BuildContext context) => NewsPage(),
        UIData.weatherRoute: (BuildContext context) => WeatherPage(),
        UIData.settingsRoute: (BuildContext context) => SettingsPage()
      },
      onUnknownRoute: (RouteSettings rs) => new MaterialPageRoute(
          builder: (context) => new NotFoundPage(
                appTitle: UIData.coming_soon,
                icon: FontAwesomeIcons.solidSmile,
                title: UIData.coming_soon,
                message: "Under Development",
                iconColor: Colors.green,
              )));

  @override
  Widget build(BuildContext context) {
    return materialApp;
  }

  _onLocaleChanged() async {
    // do anything you need to do if the language changes
    print('Language has been changed to: ');
  }
}*/

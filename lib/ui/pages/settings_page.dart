import 'package:flutter/material.dart';
import 'package:language_pickers/languages.dart';
import 'package:whatsupworld/config/palette.dart';
import 'package:whatsupworld/logic/bloc/settings/settings_bloc.dart';
import 'package:whatsupworld/ui/widgets/common_scaffold.dart';
import 'package:whatsupworld/ui/widgets/common_switch.dart';
import 'package:whatsupworld/ui/widgets/language_selector.dart';
import 'package:whatsupworld/utils/translations.dart';
import 'package:whatsupworld/utils/uidata.dart';
import 'package:language_pickers/language_pickers.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = '/settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _settingsBloc = SettingsBloc();

  
  

 /* Language _selectedDropdownLanguage =
      LanguagePickerUtils.getLanguageByIsoCode('fr');

  Widget _buildDropdownItem(Language language) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 8.0,
        ),
        Text("${language.name} (${language.isoCode})"),
      ],
    );
  }*/

 @override
  void initState() {
    super.initState();
    
  }

  Widget bodyData(BuildContext context) {
        
    return SingleChildScrollView(
        
        child: Theme(
          data: ThemeData(fontFamily: UIData.ralewayFont),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //1
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  allTranslations.text('general_settings'),
                  style: UIData.h3Style.copyWith(
                    color: Palette.appColorBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Card(
                
                color: Colors.white,
                elevation: 2.0,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.language,
                        color: Colors.red,
                      ),
                      title: new LanguageSelector(),                      
                    ),                   
                    ],
                    
                ),
              ),

              //2
             /* Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  allTranslations.text("weather"),
                  style: UIData.h3Style.copyWith(
                    color: Palette.appColorBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 2.0,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.refresh,
                        color: Colors.grey,
                      ),
                      title: Text(allTranslations.text("temperature")),
                      trailing: Icon(Icons.arrow_right),
                    ),
                  ],
                ),
              ),*/
              //3
             /* Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  allTranslations.text("news"),
                  style: UIData.h3Style.copyWith(
                    color: Palette.appColorBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 2.0,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.location_city,
                        color: Colors.orange,
                      ),
                      title: Text(allTranslations.text("country")),
                      trailing: CommonSwitch(
                        defValue: false,
                      ),
                    ),
                  ],
                ),
              ),*/
            ],
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appTitle: allTranslations.text('settings'),
      showDrawer: false,
      showFAB: false,
      actionFirstIcon: null,
      backGroundColor: Colors.grey.shade300,
      bodyData: bodyData(context),
    );
  }
}

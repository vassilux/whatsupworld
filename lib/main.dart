import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsupworld/utils/translations.dart';

import 'myapp.dart';
import 'simple_bloc_delegate.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  //
  BlocSupervisor.delegate = SimpleBlocDelegate();
  //
   await allTranslations.init();

  //
  runApp(MyApp());
}

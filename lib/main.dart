//Utilice la version de flutter 2.12.2
//Provaider como gestor de estado.


import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:prueba_proyecto_tareas/pages/pages.dart';
import 'package:prueba_proyecto_tareas/theme/app_themes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //se manda a traer la ruta home que es donde iniciara
      initialRoute: 'home', 
      theme: AppThemes.lightTheme,
      title: 'Proyecto de prueba Tareas',
      localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate
    ],
    supportedLocales: const [
      Locale('es', 'ES'),
    ],
    //rutas principales
      routes: {
        'home':(_) => const HomePage(),
      },
    );
  }
}
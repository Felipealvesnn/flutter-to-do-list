import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_to_do_list/app/data/db.ultil.commum.dart';
import 'package:flutter_to_do_list/app/modules/home/bindings/home_binding.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:flutter_to_do_list/app/routes/app_pages.dart';
import 'package:flutter_to_do_list/app/theme/colors/light_colors.dart';

void main() async {
  await DatabaseHelper.openDatabase();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: LightColors.kLightYellow, // navigation bar color
    statusBarColor: Color(0xffffb969), // status bar color
  ));

  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('ar', ''), // Arabic, no country code
        Locale('fr', ''),
        Locale('pt_BR', ''),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: LightColors
              .kDarkYellow, // Define a cor de fundo globalmente para todos os AppBar
        ),
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: LightColors.kDarkBlue,
            displayColor: LightColors.kDarkBlue,
            fontFamily: 'Poppins'),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: HomeBinding(),
      debugShowCheckedModeBanner: false,
    );
  }
}

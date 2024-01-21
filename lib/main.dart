import 'package:flutter/material.dart';
import 'package:flutter_application_1/Hak%20Akses/contact_provider.dart';
import 'package:flutter_application_1/firestore/home.dart';
import 'package:flutter_application_1/kategori.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/pengaturan/pengaturan_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/History/kesehatan_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => KesehatanProvider()),
      ChangeNotifierProvider(create: (_) => ContactProvider()),
      ChangeNotifierProvider(create: (_) => PengaturanProvider()),
    ],
    child: MyApp(isLoggedIn: isLoggedIn),
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ["lib/i18n"];
    final prov = Provider.of<PengaturanProvider>(context);
    return MaterialApp(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('id', 'ID'),
        Locale('ar', 'SA')
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        LocalJsonLocalization.delegate
      ],
      localeListResolutionCallback: (locales, supportedLocales) {
        for (var locale in locales!) {
          if (supportedLocales.contains(locale)) {
            return locale;
          }
          return const Locale('id', 'ID');
        }
      },
      locale: prov.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: isLoggedIn ? const DoctorSearchPage() : const LoginPage(),
      // home: MyHome(),
    );
  }
}

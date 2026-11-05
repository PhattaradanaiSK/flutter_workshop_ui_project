import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/e01_page_ui.dart';
import 'screens/ui_tokens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const OrangeApp());
}

class OrangeApp extends StatelessWidget {
  const OrangeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orange ส้ม',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kOrange,
          primary: kOrange,
          surface: Colors.white,
        ),
        fontFamily: 'Poppins',
        visualDensity: VisualDensity.standard,
      ),
      home: const E01PageUI(),
    );
  }
}

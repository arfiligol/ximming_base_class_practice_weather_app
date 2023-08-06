import 'package:flutter/material.dart';

// For state management
import 'package:get/get.dart';

// Locale
import 'package:flutter_localizations/flutter_localizations.dart';

// For reading environment variables
import 'package:flutter_dotenv/flutter_dotenv.dart';

// For Firebase packages
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Local packages
import './controllers/global.dart';
import './screens/loading.dart';
import './screens/home.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final GlobalController globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Weather App',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale("en"), Locale("zh"), Locale("zh_TW")],
        home: Obx(() {
          // Obx() -> 狀態更動，會 rebuild 內部的東西
          if (globalController.isLoading.isTrue) {
            return const LoadingScreen();
          } else {
            return HomeScreen();
          }
        }));
  }
}

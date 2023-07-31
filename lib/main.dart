import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './controllers/global.dart';
import './screens/loading.dart';
import './screens/home.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final GlobalController globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Weather App',
        home: Obx(() {
          // Obx() -> 狀態更動，會 rebuild 內部的東西
          if (globalController.isLoading.isTrue) {
            return LoadingScreen();
          } else {
            return const HomeScreen();
          }
        }));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ximming_base_practice_whether_app/components/weather_card.dart';
import 'package:ximming_base_practice_whether_app/controllers/global.dart';

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalController globalController = Get.find();

    return Scaffold(
        appBar: AppBar(
          title: Text(globalController.selectedLocation.value),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              globalController.selectedLocation.value = "";
              Get.back(); // 返回上一個頁面
            },
          ),
        ),
        body: const WeatherCard()
        // ...
        );
  }
}

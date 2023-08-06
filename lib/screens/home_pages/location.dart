import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/global.dart';
import './weather.dart';

class LocationPage extends StatelessWidget {
  LocationPage({super.key});

  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    // 取得 locations
    List<String> locations = globalController.locations;

    return Scaffold(
        appBar: AppBar(title: const Text("請選擇地區")),
        body: GridView.builder(
            itemCount: locations.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 這裡可以設定每行要顯示幾個方塊
            ),
            itemBuilder: (BuildContext context, int index) {
              return MouseRegion(
                cursor: SystemMouseCursors.click, // 滑鼠滑上去時，指標會變成點擊形狀
                child: InkWell(
                  onTap: () {
                    // 在這裡處理用戶點擊方塊的事件
                    globalController.selectedLocation.value = locations[index];
                    Get.to(() => const WeatherPage());
                  },
                  child: Card(
                    child: Center(
                      child: Text(locations[index]),
                    ),
                  ),
                ),
              );
            }));
  }
}

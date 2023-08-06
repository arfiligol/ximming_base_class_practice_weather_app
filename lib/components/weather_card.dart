import 'package:flutter/material.dart';
import 'package:ximming_base_practice_whether_app/controllers/global.dart';
import 'package:ximming_base_practice_whether_app/models/weather/element.dart';
import 'package:ximming_base_practice_whether_app/services/weather_record_service.dart';
import 'package:get/get.dart';
import '../models/weather_record.dart';

/*

資訊呈現部分我用 chatGPT 生成的
應該有很多部分可以拆，有機會再精進

*/

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController = Get.find();

    print("Before FutureBuilder");

    return FutureBuilder(
        future: WeatherRecordService.getWeatherRecords(
            globalController.selectedLocation.value),
        builder:
            (BuildContext context, AsyncSnapshot<WeatherRecord> asyncSnapshot) {
          WeatherRecord record;

          // 確認與遠端系統交互的連線狀態
          // print(asyncSnapshot.connectionState);
          // 確認是否已取得資料
          // print(asyncSnapshot.hasData);

          // 如果連線狀態為已完成，則取用數據，並轉換成Text
          if (asyncSnapshot.connectionState == ConnectionState.done) {
            print(asyncSnapshot.connectionState);

            // 檢查有無錯誤
            if (asyncSnapshot.hasError) {
              return Text("Error: ${asyncSnapshot.error}");
            } else {
              record = asyncSnapshot.requireData;
              print(record.locationName); // 確認一下

              // 定義更友好的天氣元素名稱
              Map<String, String> elementNames = {
                'Wx': '天氣狀況',
                'PoP': '降雨機率',
                'MinT': '最低溫度',
                'CI': '舒適度指數',
                'MaxT': '最高溫度',
              };

              // 創建一個映射，鍵是時間段，值是該時間段的所有天氣元素
              Map<String, List<WeatherElement>> timeToElements = {};

              for (var element in record.weatherElement) {
                for (var time in element.time) {
                  var timePeriod = '${time.startTime} - ${time.endTime}';
                  if (!timeToElements.containsKey(timePeriod)) {
                    timeToElements[timePeriod] = [];
                  }
                  timeToElements[timePeriod]!.add(element);
                }
              }

              // 為每個時間段創建一個卡片
              List<Card> cards = [];
              for (var timePeriod in timeToElements.keys) {
                var elements = timeToElements[timePeriod];
                cards.add(
                  Card(
                    elevation: 5, // 卡片陰影
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)), // 卡片圓角
                    margin: const EdgeInsets.all(10), // 卡片間距
                    child: Padding(
                      // 卡片內部間距
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(timePeriod,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)), // 時間段標題
                          const Divider(color: Colors.grey), // 分隔線
                          ...elements!.map((element) {
                            var parameter = element.time
                                .firstWhere((time) =>
                                    '${time.startTime} - ${time.endTime}' ==
                                    timePeriod)
                                .parameter;
                            return RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        '${elementNames[element.elementName] ?? element.elementName}: ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: '${parameter.parameterName} ',
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                  TextSpan(
                                    text: parameter.parameterUnit ?? '',
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  ),
                );
              }

              return SingleChildScrollView(
                child: Column(
                  children: cards,
                ),
              );
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

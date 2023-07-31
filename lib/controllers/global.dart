import 'package:get/get.dart';
import 'package:ximming_base_practice_whether_app/services/locations_service.dart';

/*
實務上，不會將所以東西都透過一個 Controller 處理（尤其是系統很多 part 的時候）

但這個 App，為求方便，先將所有 state 透過一個 "GlobalController" 來控制

*/

// 在 GetX 中，依賴項管理容器是透過「Instance Type」來查找 Controller
// 我們會創建一個 Controller Instance -> 該 Controller 有 Type -> 使用 Get.find<Controller Type>() 來查找依賴項容器中該類型的 Controller
class GlobalController extends GetxController {
  // 在此宣告一些 state
  RxBool isLoading = true.obs;
  RxString selectedLocation = "".obs;
  RxList<String> locations = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    initializeLocation();
  }

  void initializeLocation() async {
    // 做初始化的動作，例如發起網路請求，讀取本地數據等
    // 例如：
    locations.value = await LocationService.getLocations();

    await Future.delayed(const Duration(seconds: 2));

    // 當數據加載完成後，更新 isLoading 的值
    isLoading.value = false;
  }
}

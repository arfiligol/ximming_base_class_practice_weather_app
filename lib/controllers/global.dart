import 'package:get/get.dart';
import 'package:ximming_base_practice_whether_app/services/locations_service.dart';

/// A global controller for managing state across the application.
///
/// In practice, it's not common to manage all state through a single controller,
/// especially for larger systems. However, for simplicity, this app uses a single
/// "GlobalController" to manage all state.
///
/// In GetX, dependency injection is done by type. We create an instance of a controller,
/// which has a type, and then use Get.find<ControllerType>() to find the controller
/// in the dependency injection container.
class GlobalController extends GetxController {
  // Declare some state variables
  RxBool isLoading = true.obs;
  RxString selectedLocation = "".obs;
  RxList<String> locations = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    initializeLocation();
  }

  /// Performs initialization tasks such as making network requests and reading local data.
  ///
  /// Initially, it fetches the locations from the [LocationService] and assigns them to the
  /// [locations] state variable.
  ///
  /// After a delay of 2 seconds, it sets the [isLoading] state variable to false, indicating
  /// that the data has been loaded and the application can navigate to the [HomeScreen].
  void initializeLocation() async {
    // Fetch the locations from the LocationService
    locations.value = await LocationService.getLocations();

    // Wait for 2 seconds
    await Future.delayed(const Duration(seconds: 2));

    // Once the data is loaded, update the value of isLoading
    isLoading.value = false;
  }
}

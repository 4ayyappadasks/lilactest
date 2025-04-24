import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  var isConnected = true.obs;

  @override
  void onInit() {
    super.onInit();
    _initConnectivity();
    Connectivity().onConnectivityChanged.listen((results) {
      isConnected.value = results.isNotEmpty &&
          results.any((result) => result != ConnectivityResult.none);
    });
  }

  Future<void> _initConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    isConnected.value = result != ConnectivityResult.none;
  }
}
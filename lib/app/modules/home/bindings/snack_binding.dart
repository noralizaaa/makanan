import 'package:get/get.dart';
import '../controllers/snack_controller.dart';

class SnackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SnackController>(() => SnackController());
  }
}

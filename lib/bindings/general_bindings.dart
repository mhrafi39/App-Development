import 'package:get/get.dart';
import 'package:gstore_official/controllers/cart_controllers.dart';

import '../utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(CartController());
  }
}

import 'package:get/instance_manager.dart';
import 'class/c_r_u_d.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}

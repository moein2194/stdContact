import 'package:contact_app/core/config/enums.dart';
import 'package:get/get.dart';

abstract class MainController extends GetxController {
  Rx<PageState> state = PageState.loaded.obs;

}

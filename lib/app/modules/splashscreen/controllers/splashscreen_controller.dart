import 'package:get/get.dart';
import 'package:mini_project_chapter_10/app/modules/login/views/login_view.dart';

class SplashscreenController extends GetxController {
  @override
  void onReady(){
    super.onReady();
    Future.delayed(Duration(seconds: 2), () {
      Get.off(
        () => LoginView(),
        transition: Transition.fade,
        duration: Duration(seconds: 4),
      );
    });
  }
}

import 'package:flutter_app_fanpage_manage/pages/page/service/login_response.dart';
import 'package:flutter_app_fanpage_manage/pages/page/service/login_service.dart';
import 'package:flutter_app_fanpage_manage/pages/page/viewcontrolle/login_controller.dart';
import 'package:get/get.dart';

class LoginBiding extends Bindings{
  @override
  void dependencies() {
    injectService();
  }

  void injectService(){
    Get.lazyPut<IHLoginProvider>(() => LoginService());
    Get.lazyPut<IHLoginResponse>(() => LoginResponse(provider: Get.find()));
    Get.lazyPut(() => LoginController(loginResponse: Get.find()));
  }
}
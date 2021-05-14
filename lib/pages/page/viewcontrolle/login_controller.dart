import 'package:flutter/cupertino.dart';
import 'package:flutter_app_fanpage_manage/pages/page/model/page_model.dart';
import 'package:flutter_app_fanpage_manage/pages/page/service/login_response.dart';
import 'package:get/get.dart';

class LoginController extends SuperController<PageModel>{

  LoginController({@required this.loginResponse});

  final IHLoginResponse loginResponse;

  @override
  void onInit() {
    // TODO: implement onInit
    append(() => loginResponse.getListPage);
    super.onInit();

  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    // TODO: implement didChangeMetrics
    super.didChangeMetrics();
  }

  @override
  void didChangePlatformBrightness() {
    // TODO: implement didChangePlatformBrightness
    super.didChangePlatformBrightness();
  }

  @override
  Future<bool> didPushRoute(String route) {
    // TODO: implement didPushRoute
    return super.didPushRoute(route);
  }

  @override
  void onDetached() {
    print("onDetached");
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    print("onInactive");
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    print("onPaused");
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    print("onResumed");
    // TODO: implement onResumed
  }

}
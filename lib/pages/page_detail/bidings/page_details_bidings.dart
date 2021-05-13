import 'package:flutter/cupertino.dart';
import 'package:flutter_app_fanpage_manage/pages/page_detail/domain/page_detail_api_service.dart';
import 'package:flutter_app_fanpage_manage/pages/page_detail/domain/page_detail_response.dart';
import 'package:flutter_app_fanpage_manage/pages/page_detail/presentation/page_detail_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

class PageDetailBidings extends Bindings{

  @override
  void dependencies() {
    injectService();
  }

  void injectService(){
      Get.lazyPut<IPageDetailProvider>(() => PageDetailAPIService());
      Get.lazyPut<IPageDetailResponse>(() => PageDetailResponse(provider: Get.find()));
      Get.lazyPut(() => PageDetailController());
  }
}
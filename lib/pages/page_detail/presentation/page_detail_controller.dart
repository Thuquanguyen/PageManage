import 'package:flutter/cupertino.dart';
import 'package:flutter_app_fanpage_manage/pages/page_detail/data/page_detail_model.dart';
import 'package:flutter_app_fanpage_manage/pages/page_detail/domain/page_detail_response.dart';
import 'package:get/get.dart';

class PageDetailController extends SuperController<PageDetailModel>{

  final IPageDetailResponse response;
  PageDetailController({@required this.response});

  @override
  void onInit() {
    append(() => response.getListPost);
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void update([List<Object> ids, bool condition = true]) {
    // TODO: implement update
    super.update(ids, condition);
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
  void didChangeAccessibilityFeatures() {
    // TODO: implement didChangeAccessibilityFeatures
    super.didChangeAccessibilityFeatures();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }

}
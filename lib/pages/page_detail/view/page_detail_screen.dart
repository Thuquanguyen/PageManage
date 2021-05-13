import 'package:flutter/material.dart';
import 'package:flutter_app_fanpage_manage/pages/page/viewcontrolle/login_controller.dart';
import 'package:get/get.dart';

class PageDetailView extends GetView<LoginController>{
  static const String routerName = "/page-detail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết Fanpage"),
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Center(child: Text("Fanpage"),),
    );
  }
}
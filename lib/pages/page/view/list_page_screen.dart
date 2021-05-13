import 'package:flutter/material.dart';
import 'package:flutter_app_fanpage_manage/pages/page/model/page_model.dart';
import 'package:flutter_app_fanpage_manage/pages/page/viewcontrolle/login_controller.dart';
import 'package:get/get.dart';

class ListPageScreen extends GetView<LoginController> {
  static const routerName = "/list-page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách Fanpage"),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: controller.obx((state) {
        return Container(
          child: _listPage(state.data),
          margin: const EdgeInsets.all(15),
        );
      }),
    );
  }
}

Widget _listPage(List<PageMD> listPage) => ListView.builder(
    itemBuilder: (ctx, index) {
      return Card(
        child: Container(
            padding: const EdgeInsets.all(10),
            height: 50,
            child: Align(
              child: Text("data ${listPage[index].category}"),
              alignment: Alignment.centerLeft,
            )),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      );
    },
    itemCount: listPage.length);

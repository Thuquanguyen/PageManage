import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_fanpage_manage/common/util.dart';
import 'package:flutter_app_fanpage_manage/pages/page/login_biding/login_biding.dart';
import 'package:flutter_app_fanpage_manage/pages/page/view/list_page_screen.dart';
import 'package:flutter_app_fanpage_manage/pages/page/view/login_screen.dart';
import 'package:flutter_app_fanpage_manage/pages/page_detail/bidings/page_details_bidings.dart';
import 'package:flutter_app_fanpage_manage/pages/page_detail/view/page_detail_screen.dart';
import 'package:get/get.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      title: "Page Manage",
      theme: Util.themeData,
      initialRoute: LoginScreen.routerName,
      getPages: [
        GetPage(name: LoginScreen.routerName, page: () => LoginScreen()),
        GetPage(name: ListPageScreen.routerName, page: () => ListPageScreen(),binding: LoginBiding()),
        GetPage(name: PageDetailView.routerName, page: () => PageDetailView(),binding: PageDetailBidings())
      ],
    );
  }
}

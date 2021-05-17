import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_fanpage_manage/common/util.dart';
import 'package:flutter_app_fanpage_manage/pages/detail_newspaper/detail_newspaper_screen.dart';
import 'package:flutter_app_fanpage_manage/pages/home/home_screen.dart';
import 'package:flutter_app_fanpage_manage/pages/list_page/list_page_screen.dart';
import 'package:flutter_app_fanpage_manage/pages/list_post/list_post_screen.dart';
import 'package:flutter_app_fanpage_manage/pages/login/login_screen.dart';
import 'package:flutter_app_fanpage_manage/pages/splat_screen/splat_view.dart';
import 'package:flutter_app_fanpage_manage/provider/login_provider.dart';
import 'package:flutter_app_fanpage_manage/router.dart';

import 'bloc/bloc_provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  PageProvider _bloc = PageProvider.instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          initialRoute: SplatView.routeName,
          onGenerateRoute: Routerr.generateRoute,
          routes: {
            SplatView.routeName: (_) => SplatView(),
            LoginScreen.routerName: (_) => LoginScreen(),
            ListPageScreen.routerName: (_) => ListPageScreen(),
            ListPostScreen.routerName: (_) => ListPostScreen(),
            HomeScreen.routerName: (_) => HomeScreen(),
            DetailNewspaperScreen.routeName: (_) => DetailNewspaperScreen()
          },
        ),
        bloc: _bloc);
  }
}
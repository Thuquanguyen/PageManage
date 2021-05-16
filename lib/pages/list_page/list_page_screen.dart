import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_fanpage_manage/common/util.dart';
import 'package:flutter_app_fanpage_manage/model/newspaper_model.dart';
import 'package:flutter_app_fanpage_manage/model/page_model.dart';
import 'package:flutter_app_fanpage_manage/pages/list_post/list_post_screen.dart';
import 'package:flutter_app_fanpage_manage/provider/login_provider.dart';
import 'package:get/get.dart';

class ListPageScreen extends StatefulWidget {
  static const routerName = "/list-page";

  @override
  _ListPageScreenState createState() => _ListPageScreenState();
}

class _ListPageScreenState extends State<ListPageScreen> {
  PageProvider _bloc = PageProvider.instance;

  List<PageMD> listPage;
  @override
  Widget build(BuildContext context) {
    final String token = ModalRoute.of(context).settings.arguments as String;
    print("tokekekeke : $token");
    _bloc.getListSubject(token);

    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách Fanpage"),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: StreamBuilder<PageModel>(
        stream: _bloc.pageStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                child: Center(child: CupertinoActivityIndicator()));
          } else if (snapshot.error != null) {
            return Container(
                child:
                Center(child: Text("Đã có lỗi xảy ra vui lòng thử lại!")));
          } else {
            return Container(
              child: _listPage(snapshot.data.data,context),
              margin: const EdgeInsets.all(15),
            );
          }
        },
      ),
    );
  }
}


Widget _listPage(List<PageMD> listPage,BuildContext context) => ListView.builder(
    itemBuilder: (ctx, index) {
      return GestureDetector(
        child: Card(
          child: Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              child: Align(
                child: Text("${listPage[index].category}"),
                alignment: Alignment.centerLeft,
              )),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(ListPostScreen.routerName,arguments: listPage[index]);
        },
      );
    },
    itemCount: listPage.length);

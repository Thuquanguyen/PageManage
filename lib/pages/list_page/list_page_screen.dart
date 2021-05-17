import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_fanpage_manage/common/util.dart';
import 'package:flutter_app_fanpage_manage/model/newspaper_model.dart';
import 'package:flutter_app_fanpage_manage/model/page_model.dart';
import 'package:flutter_app_fanpage_manage/pages/list_post/list_post_screen.dart';
import 'package:flutter_app_fanpage_manage/provider/login_provider.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ListPageScreen extends StatefulWidget {
  static const routerName = "/list-page";

  @override
  _ListPageScreenState createState() => _ListPageScreenState();
}

class _ListPageScreenState extends State<ListPageScreen> {
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  PageProvider _bloc = PageProvider.instance;
  List<PageMD> listPage;

  Future<Null> _logOut() async {
    await facebookSignIn.logOut();
  }

  @override
  Widget build(BuildContext context) {
    Util.readReferent(Util.KEY_TOKEN).then((value) {
      _bloc.getListSubject(value);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách Fanpage"),
          actions: [
            IconButton(onPressed: (){
              _logOut();
            }, icon: Icon(Icons.logout))
          ]
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
          pushNewScreenWithRouteSettings(context,
              screen: ListPostScreen(),
              settings: RouteSettings(
                  name: ListPostScreen.routerName, arguments: listPage[index]));
          // Navigator.of(context).pushNamed(ListPostScreen.routerName,arguments: );
        },
      );
    },
    itemCount: listPage.length);

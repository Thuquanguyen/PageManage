import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_fanpage_manage/common/util.dart';
import 'package:flutter_app_fanpage_manage/model/page_detail_model.dart';
import 'package:flutter_app_fanpage_manage/model/page_model.dart';
import 'package:flutter_app_fanpage_manage/provider/list_post_provider.dart';
import 'package:flutter_app_fanpage_manage/provider/login_provider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ListPostScreen extends StatelessWidget {
  static const routerName = "/list-post";
  PostProvider _bloc = PostProvider.instance;
  List<PageMD> listPage;

  @override
  Widget build(BuildContext context) {
    final PageMD pageModel = ModalRoute.of(context).settings.arguments as PageMD;
    print("tokekekeke : ${pageModel.accessToken}");
    _bloc.getListSubject(pageModel.id, pageModel.accessToken);

    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách Fanpage"),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: StreamBuilder<PageDetailModel>(
        stream: _bloc.postStream,
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


Widget _listPage(List<PostModel> listPage,BuildContext context) => ListView.builder(
    itemBuilder: (ctx, index) {
      return GestureDetector(
        child: Card(
          child: Container(
            height: 510,
              padding: const EdgeInsets.all(10),
              child: Html(
                data: '''
                <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fpermalink.php%3Fstory_fbid%3D654243921801272%26id%3D292440411314960&width=500&show_text=true&appId=667306053886758&height=778" width="${MediaQuery.of(context).size.width - 20}" height="500" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>''',
              )),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onTap: () {},
      );
    },
    itemCount: listPage.length);

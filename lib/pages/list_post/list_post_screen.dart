import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_fanpage_manage/model/page_detail_model.dart';
import 'package:flutter_app_fanpage_manage/model/page_model.dart';
import 'package:flutter_app_fanpage_manage/provider/list_post_provider.dart';
import 'package:get/get.dart';
import 'package:social_embed_webview/platforms/facebook-post.dart';
import 'package:social_embed_webview/social_embed_webview.dart';

class ListPostScreen extends StatefulWidget {
  static const routerName = "/list-post";

  @override
  _ListPostScreenState createState() => _ListPostScreenState();
}

class _ListPostScreenState extends State<ListPostScreen> with AutomaticKeepAliveClientMixin<ListPostScreen>{
  PostProvider _bloc = PostProvider.instance;

  List<PageMD> listPage;

  @override
  Widget build(BuildContext context) {
    final PageMD pageModel =
        ModalRoute.of(context).settings.arguments as PageMD;
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
              child: SingleChildScrollView(child: _listPage(pageModel,snapshot.data.data,context),),
              margin: const EdgeInsets.all(15),
            );
          }
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

Widget _listPage(PageMD pageMD,List<PostModel> listPage, BuildContext context)
{
    return ListView.builder(
      physics: ClampingScrollPhysics(),
        shrinkWrap: true,
      addAutomaticKeepAlives: true,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            child: Card(
              child: Column(
                  children: [FacebookPostEmbedData(postUrl: "https://www.facebook.com/${pageMD.id}/posts/${listPage[index].id.split("_")[1]}/")]
                      .map((o) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SocialEmbed(
                      socialMediaObj: o,
                    ),
                  ))
                      .toList()),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onTap: () {}
          );
        },
        itemCount: 3);}

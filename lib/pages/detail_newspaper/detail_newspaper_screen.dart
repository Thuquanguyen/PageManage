import 'package:flutter/material.dart';
import 'package:flutter_app_fanpage_manage/model/newspaper_model.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailNewspaperScreen extends StatelessWidget {
  static const String routeName = "/detail_newspaper";

  const DetailNewspaperScreen({Key key}) : super(key: key);

  shareOnFacebook(String url, String message)  {
    print("share shae share");
    FlutterShareMe().shareToFacebook(
        url: url, msg: message);
  }

  @override
  Widget build(BuildContext context) {
    final NewspaperModel newspaperModel =
        ModalRoute.of(context).settings.arguments as NewspaperModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(newspaperModel.title),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(onPressed: (){
            shareOnFacebook(newspaperModel.link, newspaperModel.title);
          }, icon: Icon(Icons.share,color: Colors.white))
        ],
      ),
      body: Container(
        child: WebView(
            initialUrl: newspaperModel.link,
            javascriptMode: JavascriptMode.unrestricted),
      ),
    );
  }
}

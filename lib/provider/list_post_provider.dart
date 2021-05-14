import 'dart:async';

import 'package:flutter_app_fanpage_manage/bloc/bloc_base.dart';
import 'package:flutter_app_fanpage_manage/model/page_detail_model.dart';
import 'package:flutter_app_fanpage_manage/model/page_model.dart';
import 'package:flutter_app_fanpage_manage/service/api.dart';

class PostProvider extends BlocBase {
  PostProvider._internal();

  static final PostProvider _instance = PostProvider._internal();

  static PostProvider get instance => _instance;

  final StreamController<PageDetailModel> _streamController =
  StreamController.broadcast();

  Stream<PageDetailModel> get postStream => _streamController.stream;

  final Api subjectProvider = Api();

  Future<PageDetailModel> getListSubject(String idPage,String tokenPage) async {
    PageDetailModel postModel =
    await subjectProvider.getListPost(idPage, tokenPage);
    print("data : ${postModel}");
    if (postModel == null) {
      _streamController.sink.addError("error");
    } else {
      _streamController.sink.add(postModel);
    }
    return postModel;
  }

  @override
  void dispose() {
    _streamController.close();
  }
}

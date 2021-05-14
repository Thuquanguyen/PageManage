import 'dart:async';

import 'package:flutter_app_fanpage_manage/bloc/bloc_base.dart';
import 'package:flutter_app_fanpage_manage/model/page_model.dart';
import 'package:flutter_app_fanpage_manage/service/api.dart';

class PageProvider extends BlocBase {
  PageProvider._internal();

  static final PageProvider _instance = PageProvider._internal();

  static PageProvider get instance => _instance;

  final StreamController<PageModel> _streamController =
  StreamController.broadcast();

  Stream<PageModel> get pageStream => _streamController.stream;

  final Api subjectProvider = Api();

  Future<PageModel> getListSubject(String token) async {
    print("tokeeeen : $token");

    PageModel pageModel =
    await subjectProvider.getListPage(token);
    print("data : ${pageModel}");
    if (pageModel == null) {
      _streamController.sink.addError("error");
    } else {
      _streamController.sink.add(pageModel);
    }
    return pageModel;
  }

  @override
  void dispose() {
    _streamController.close();
  }
}

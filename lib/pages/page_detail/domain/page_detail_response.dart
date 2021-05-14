

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_fanpage_manage/common/util.dart';
import 'package:flutter_app_fanpage_manage/pages/page_detail/data/page_detail_model.dart';
import 'package:flutter_app_fanpage_manage/pages/page_detail/domain/page_detail_api_service.dart';

abstract class IPageDetailResponse{
  Future<PageDetailModel> getListPost();
}

class PageDetailResponse implements IPageDetailResponse{

  final IPageDetailProvider provider;
  PageDetailResponse( {@required this.provider});

  @override
  Future<PageDetailModel> getListPost() async{
    String idPage = "";
    String tokenPage = "";
    print("akkakakaka");
    await Util.readReferent(Util.KEY_ID_PAGE).then((value){
      idPage = value as String;
    });
    await Util.readReferent(Util.KEY_TOKEN_PAGE).then((value){
      tokenPage = value as String;
    });
    print("id Page : $idPage");
    print("token Page : $tokenPage");
    final response = await provider.getListPost(idPage, tokenPage);
    if (response.hasError){
      return Future.error(response.statusText);
    }else{
      return response.body;
    }
  }
}
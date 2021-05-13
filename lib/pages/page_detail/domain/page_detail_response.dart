

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_fanpage_manage/pages/page_detail/data/page_detail_model.dart';
import 'package:flutter_app_fanpage_manage/pages/page_detail/domain/page_detail_api_service.dart';

abstract class IPageDetailResponse{
  Future<PageDetailModel> getListPost({@required String idPage,@required String tokenPage});
}
class PageDetailResponse implements IPageDetailResponse{

  final IPageDetailProvider provider;
  PageDetailResponse( {@required this.provider});

  @override
  Future<PageDetailModel> getListPost({@required String idPage,@required String tokenPage}) async{
    final response = await provider.getListPost(idPage, tokenPage);
    if (response.hasError){
      return Future.error(response.statusText);
    }else{
      return response.body;
    }
  }
}
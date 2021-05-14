import 'dart:convert';
import 'package:flutter_app_fanpage_manage/common/util.dart';
import 'package:flutter_app_fanpage_manage/pages/page_detail/data/page_detail_model.dart';
import 'package:get/get.dart';

abstract class IPageDetailProvider{
  Future<Response<PageDetailModel>> getListPost(String idPage,String tokenPage);
}

class PageDetailAPIService extends GetConnect implements IPageDetailProvider{

  @override
  Future<Response<PageDetailModel>> getListPost(String idPage, String tokenPage) => get("$idPage/feed?limit=100&access_token=$tokenPage&format=json");
}
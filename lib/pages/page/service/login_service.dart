import 'dart:convert';
import 'package:flutter_app_fanpage_manage/common/util.dart';
import 'package:flutter_app_fanpage_manage/pages/page/model/page_model.dart';
import 'package:get/get.dart';

abstract class IHLoginProvider{
  Future<Response<PageModel>> getListPage(String token);
}
class LoginService extends GetConnect implements IHLoginProvider{
  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => PageModel.fromJson(json.decode(val));
    httpClient.baseUrl = Util.BASE_URL;
    super.onInit();
  }

  @override
  Future<Response<PageModel>> getListPage(String token) => get("/me/accounts/page?access_token=$token");
}
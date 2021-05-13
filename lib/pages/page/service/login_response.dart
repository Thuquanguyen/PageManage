import 'package:flutter/cupertino.dart';
import 'package:flutter_app_fanpage_manage/common/util.dart';
import 'package:flutter_app_fanpage_manage/pages/page/model/page_model.dart';

import 'login_service.dart';

abstract class IHLoginResponse{
  Future<PageModel> getListPage();
}

class LoginResponse implements IHLoginResponse{
  final IHLoginProvider provider;

  LoginResponse({@required this.provider});

  @override
  Future<PageModel> getListPage() async{
    String data = "";
    await Util.readReferent(Util.KEY_TOKEN).then((value){
      data = value as String;
    });
    final response = await provider.getListPage(data);
    if (response.status.hasError){
      print("response 111111 : ${response.statusText}");
      return Future.error(response.statusText);
    }else{
      print("response : ${response.body}");
      return response.body;
    }

  }

}
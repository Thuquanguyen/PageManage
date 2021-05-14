import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app_fanpage_manage/common/util.dart';
import 'package:flutter_app_fanpage_manage/model/page_detail_model.dart';
import 'package:flutter_app_fanpage_manage/model/page_model.dart';
import 'package:http/http.dart';

class Api {
  var client = Client();

  Future<PageModel> getListPage(String token) async {
    var response;
    var url = Uri.parse('${Util.BASE_URL}/me/accounts/page?access_token=$token');

    try {
      response = await client.get(url);
    } on Exception {
      print("client exceltion");
      return null;
    }
    if (response.statusCode == 200) {
      PageModel pageModel;
      try {
        pageModel = PageModel.fromJson(json.decode(response.body));
      } on FormatException {
        print("json format exception");
      }
      return pageModel;
    } else {
      print("request error: ${response.body}");
      return null;
    }
  }

  Future<PageDetailModel> getListPost(String idPage,String tokenPage) async {
    var response;
    var url = Uri.parse('${Util.BASE_URL}/$idPage/feed?limit=100&access_token=$tokenPage&format=json');

    try {
      response = await client.get(url);
    } on Exception {
      print("client exceltion");
      return null;
    }
    if (response.statusCode == 200) {
      PageDetailModel postModel;
      try {
        postModel = PageDetailModel.fromJson(json.decode(response.body));
      } on FormatException {
        print("json format exception");
      }
      return postModel;
    } else {
      print("request error: ${response.body}");
      return null;
    }
  }
}

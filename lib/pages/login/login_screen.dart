import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_fanpage_manage/common/util.dart';
import 'package:flutter_app_fanpage_manage/pages/list_page/list_page_screen.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class LoginScreen extends StatefulWidget {
  static const String routerName = '/login';

  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  String _message = 'Log in/out '
      ''
      'by pressing the buttons below.';

  Future<Null> _login() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        print("accessToken.token : ${accessToken.token}");
        Util.saveReferent(Util.KEY_TOKEN, accessToken.token);
        Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(
          builder: (BuildContext context) {
            return ListPageScreen();
          },settings: RouteSettings(
            name: ListPageScreen.routerName, arguments: accessToken.token)
        ), (route) => false);
        _showMessage('''
         Logged in!
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         name: ${result.status}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }



  void _showMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      color: Colors.white,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Đăng nhập Facebook'),
        ),
        body: new Center(
          child: GestureDetector(child: Image.asset("assets/images/facebook_sign_in_button.png",
            fit: BoxFit.cover,height: 100,),onTap: (){
            _login();
          },),
        ),
      ),
    );
  }
}

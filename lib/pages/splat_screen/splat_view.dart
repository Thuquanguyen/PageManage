import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_fanpage_manage/pages/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// wisth : 360
// height : 640
class SplatView extends StatefulWidget {
  static const routeName = '/splat';

  @override
  _SplatScreenState createState() => _SplatScreenState();
}

class _SplatScreenState extends State<SplatView> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<int> _counter;
  @override
  void initState() {
    _counter = _prefs.then((SharedPreferences prefs) {
      Future.delayed(new Duration(milliseconds: 2000),(){
      Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => HomeScreen()),
      (Route<dynamic> route) => false);
      });
      return (prefs.getInt('intro') ?? 0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (context, snapshot) => Scaffold(
            backgroundColor: Color.fromRGBO(245, 245, 245, 1),
            body: Container(
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Center(
                      child: Image.asset("assets/images/img_splat.png",
                          fit: BoxFit.cover)),
                ],
              ),
            )),
        future: _counter);
  }
}

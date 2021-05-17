import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_fanpage_manage/model/newspaper_model.dart';
import 'package:flutter_app_fanpage_manage/pages/detail_newspaper/detail_newspaper_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NewSpaperScreen extends StatefulWidget {
  const NewSpaperScreen({Key key}) : super(key: key);

  @override
  _NewSpaperScreenState createState() => _NewSpaperScreenState();
}

class _NewSpaperScreenState extends State<NewSpaperScreen> {
  List<NewspaperModel> listNewspaper = [];

  Future<dynamic> getListPost() async {
    DatabaseReference databaseRef = FirebaseDatabase.instance.reference();
    await databaseRef.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> map = snapshot.value;
      map.forEach((key, value) {
        // print('$key: $value');
        var newspaper = NewspaperModel.fromJson(value);
        setState(() {
          listNewspaper.add(newspaper);
        });
      });
      print("count : ${listNewspaper.length}");
    });
  }

  @override
  void initState() {
    getListPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách bài báo"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return GestureDetector(child: Container(
              height: 80,
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Card(child: Align(child: ListTile(title: Text(listNewspaper[index].title,maxLines: 1,),
                subtitle: Text(listNewspaper[index].link,maxLines: 1,),leading: Icon(Icons.pages),),
                alignment: Alignment.topCenter,),)
          ),onTap: (){
            pushNewScreenWithRouteSettings(context,
                screen: DetailNewspaperScreen(),
                settings: RouteSettings(
                    name: DetailNewspaperScreen.routeName, arguments: listNewspaper[index]));
          },);
        },
        itemCount: listNewspaper.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app_fanpage_manage/common/util.dart';
import 'package:flutter_app_fanpage_manage/pages/list_page/list_page_screen.dart';
import 'package:flutter_app_fanpage_manage/pages/login/login_screen.dart';
import 'package:flutter_app_fanpage_manage/pages/newspaper_screen/newspaper_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeScreen extends StatefulWidget {
  static const String routerName = '/home_screen';
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = <Widget>[
    NewSpaperScreen(),
  ];

  final List<PersistentBottomNavBarItem> _items = [
    PersistentBottomNavBarItem(title: "Fanpage", icon: Icon(Icons.pages)),
    PersistentBottomNavBarItem(title: "Tin tức", icon: Icon(Icons.book_online))
  ]; // Cre

  PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    Util.readReferent(Util.KEY_TOKEN).then((value) {
      print("value kakak : $value");
      setState(() {
        if(value == null){
          _pages.insert(0, LoginScreen());
        }else{
          _pages.insert(0, ListPageScreen());
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _pages,
        items: _items,
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app_fanpage_manage/pages/login/login_screen.dart';
import 'package:flutter_app_fanpage_manage/pages/newspaper_screen/newspaper_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routerName = '/home_screen';
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = <Widget>[
    LoginScreen(),
    NewSpaperScreen(),
  ];

  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(title: Text("Fanpage"), icon: Icon(Icons.pages)),
    BottomNavigationBarItem(title: Text("Tin tức"), icon: Icon(Icons.book_online)),
//    BottomNavigationBarItem(
//        title: Text("Quảng cáo"), icon: Icon(Icons.account_balance_wallet))
  ]; // Cre

  final PageStorageBucket _bucket =
  PageStorageBucket();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(bucket: _bucket,child: IndexedStack(children: _pages, index: _selectedIndex)),
    );
  }

  Widget _bottomNavigationBar(int selectedIndex) =>
      BottomNavigationBar(
          onTap: (int index) {
            setState(() => _selectedIndex = index);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromRGBO(39, 65, 143, 1),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          items: _items);
}

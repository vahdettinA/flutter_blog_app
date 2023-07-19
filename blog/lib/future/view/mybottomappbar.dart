import 'package:blog/future/view/home.dart';
import 'package:blog/future/view/make_blog.dart';
import 'package:blog/future/view/save.dart';
import 'package:blog/future/view/search.dart';
import 'package:blog/product/const/icon_const.dart';
import 'package:blog/product/theme/mytheme.dart';
import 'package:flutter/material.dart';

class MyBottomTabbar extends StatefulWidget {
  const MyBottomTabbar({Key? key}) : super(key: key);

  @override
  State<MyBottomTabbar> createState() => _MyBottomTabbarState();
}

class _MyBottomTabbarState extends State<MyBottomTabbar> {
  Widget body = Home();
  List<Widget> screen = [
    Home(),
    Search(),
    Save(),
  ];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BlogScreen()));
        },
        child: Icon(
          Icons.add,
          color: MyTheme.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current,
        type: BottomNavigationBarType.fixed,
        backgroundColor: MyTheme.white,
        iconSize: 24,
        selectedItemColor: MyTheme.black,
        unselectedItemColor: MyTheme.grey,
        onTap: (value) {
          setState(() {
            current = value;
            body = screen[current];
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(IconsEnum.ic_house.image), label: "Home"),
          BottomNavigationBarItem(
              icon: ImageIcon(IconsEnum.ic_search.image), label: "Search"),
          BottomNavigationBarItem(
              icon: ImageIcon(IconsEnum.ic_bookmark.image), label: "Save"),
        ],
      ),
      body: body,
    );
  }
}

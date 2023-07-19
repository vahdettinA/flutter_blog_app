import 'package:blog/future/service/firebase_service.dart';
import 'package:blog/future/service/user_service.dart';
import 'package:blog/future/view/login.dart';
import 'package:blog/product/companent/my_listview.dart';
import 'package:blog/product/theme/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController controller;
  late ScrollController scrollController;
  @override
  void initState() {
    controller = TabController(vsync: this, length: 5);
    scrollController = ScrollController();
    super.initState();
  }

  MyService service = MyService();
  UserService _userservice = UserService();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  _userservice.out().then((value) {
                    context.navigateToPage(Login());
                  });
                },
                child: Text("Çıkış Yap"))
          ],
          backgroundColor: MyTheme.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            "HOME",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: MyTheme.black, fontWeight: FontWeight.w700),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              width: double.infinity,
              color: MyTheme.white,
              child: ListView(
                controller: scrollController,
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.animateTo(0);
                      },
                      child: const Text("For you",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.black))),
                  TextButton(
                      onPressed: () {
                        controller.animateTo(1);
                      },
                      child: const Text("Software Engineering",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.black))),
                  TextButton(
                      onPressed: () {
                        controller.animateTo(2);
                      },
                      child: const Text("Flutter",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.black))),
                  TextButton(
                      onPressed: () {
                        controller.animateTo(3);
                      },
                      child: const Text("UI",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.black))),
                  TextButton(
                      onPressed: () {
                        controller.animateTo(4);
                      },
                      child: const Text("UX",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.black))),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(controller: controller, children: [
              MyListview(stream: service.getData("for")),
              MyListview(stream: service.getData("Software Engineering")),
              MyListview(stream: service.getData("Flutter")),
              MyListview(stream: service.getData("UI")),
              MyListview(stream: service.getData("UX")),
            ]))
          ],
        ),
      ),
    );
  }
}

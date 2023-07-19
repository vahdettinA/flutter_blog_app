import 'dart:ui';

import 'package:blog/future/view/detay.dart';
import 'package:blog/product/theme/mytheme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyListview extends StatelessWidget {
  Stream<QuerySnapshot> stream;
  MyListview({required this.stream});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      color: MyTheme.white,
      child: StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? SizedBox()
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, index) {
                    DocumentSnapshot myref = snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 10),
                      child: Builder(builder: (context) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detay(
                                            baslik: myref["başlık"],
                                            detay: myref["açıklama"],
                                            name: myref["name"],
                                            resim: myref["resim"])));
                              },
                              child: Container(
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                color: MyTheme.white,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipOval(
                                          child: SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: Image.network(
                                              myref["resim"],
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(myref["name"]),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          myref["başlık"],
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                  color: MyTheme.black,
                                                  fontWeight: FontWeight.w700),
                                        ),
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: SizedBox(
                                                height: 100,
                                                width: 120,
                                                child: Image.network(
                                                  myref["resim"],
                                                  fit: BoxFit.cover,
                                                )))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              color: MyTheme.grey,
                            )
                          ],
                        );
                      }),
                    );
                  });
        },
      ),
    );
  }
}

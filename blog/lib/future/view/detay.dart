import 'package:blog/product/theme/mytheme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Detay extends StatelessWidget {
  String name;
  String resim;
  String baslik;
  String detay;

  Detay(
      {super.key,
      required this.baslik,
      required this.detay,
      required this.name,
      required this.resim});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: MyTheme.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.network(
                        resim,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: MyTheme.black,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                baslik,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: MyTheme.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                detay,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: MyTheme.black,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

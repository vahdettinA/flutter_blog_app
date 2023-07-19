import 'package:blog/future/service/firebase_service.dart';
import 'package:blog/product/companent/costum_textfield.dart';
import 'package:blog/product/theme/mytheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogScreen extends StatefulWidget {
  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _resimController = TextEditingController();
  TextEditingController _baslikController = TextEditingController();
  TextEditingController _detayController = TextEditingController();

  MyService service = MyService();
  String dropvalu = "for";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: MyTheme.black,
            )),
        backgroundColor: MyTheme.white,
        title: Text(
          "Blog Oluştur",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: MyTheme.black),
        ),
        actions: [
          TextButton(
              onPressed: () {
                service
                    .kaydet(
                        dropvalu,
                        _nameController.text,
                        _detayController.text,
                        _resimController.text,
                        _baslikController.text)
                    .then((value) {
                  setState(() {
                    _nameController.text = "";
                    _detayController.text = "";
                    _resimController.text = "";
                    _baslikController.text = "";
                  });
                });
              },
              child: Text("Kaydet"))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            CostumTextfield(
              controller: _nameController,
              hintext: "Kullanıcı adı",
              iconData: Icons.person,
            ),
            SizedBox(
              height: 10,
            ),
            CostumTextfield(
              controller: _baslikController,
              hintext: "Başlık ",
              iconData: Icons.abc,
            ),
            SizedBox(
              height: 10,
            ),
            CostumTextfield(
              controller: _resimController,
              hintext: "Resim url'si",
              iconData: Icons.image,
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButton<String>(
                value: dropvalu,
                underline: Container(
                  color: MyTheme.black,
                  height: 2,
                ),
                items: [
                  DropdownMenuItem<String>(
                    child: Text("Genel"),
                    value: "for",
                  ),
                  DropdownMenuItem<String>(
                    child: Text("Flutter"),
                    value: "Flutter",
                  ),
                  DropdownMenuItem<String>(
                    child: Text("Software Engineering"),
                    value: "Software Engineering",
                  ),
                  DropdownMenuItem<String>(
                    child: Text("UI"),
                    value: "UI",
                  ),
                  DropdownMenuItem<String>(
                    child: Text("UX"),
                    value: "UX",
                  ),
                  DropdownMenuItem<String>(
                    child: Text("Diğer"),
                    value: "Diğer",
                  ),
                ],
                onChanged: (String? newvalue) {
                  setState(() {
                    dropvalu = newvalue!;
                  });
                }),
            SizedBox(
              height: 10,
            ),
            CostumTextfield(
              controller: _detayController,
              hintext: "Blog detayı",
              iconData: Icons.details,
            ),
          ],
        ),
      ),
    );
  }
}

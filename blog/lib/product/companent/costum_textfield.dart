import 'package:blog/product/theme/mytheme.dart';
import 'package:flutter/material.dart';

class CostumTextfield extends StatelessWidget {
  String hintext;
  IconData iconData;
  TextEditingController controller;
  CostumTextfield(
      {required this.controller,
      required this.hintext,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: MyTheme.black,
      decoration: InputDecoration(
          prefixIcon: Icon(iconData),
          iconColor: MyTheme.black,
          hintText: hintext,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(width: 2, color: MyTheme.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(width: 2, color: MyTheme.grey)),
          fillColor: MyTheme.white,
          filled: true),
    );
  }
}

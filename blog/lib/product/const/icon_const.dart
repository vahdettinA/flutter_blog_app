import 'package:flutter/material.dart';

enum IconsEnum {
  ic_bookmark,
  ic_house,
  ic_search,
  ic_logo,
}

extension MyIconsEnum on IconsEnum {
  String get topath => "assets/icons/$name.png";

  AssetImage get image => AssetImage(topath);
}

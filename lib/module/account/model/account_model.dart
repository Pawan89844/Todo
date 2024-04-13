import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

class AccountModel {
  final String iconFontFamily;
  final String iconFontPackage;

  List<IconCard> iconCard;

  AccountModel(
      {required this.iconFontFamily,
      required this.iconFontPackage,
      required this.iconCard});

  factory AccountModel.fromYaml(YamlMap yaml) {
    return AccountModel(
        iconFontFamily: yaml['iconFontFamily'],
        iconFontPackage: yaml['iconFontPackage'],
        iconCard: (yaml['profile_options'] as List)
            .map((items) => IconCard.fromYaml(items))
            .toList());
  }

  static IconData iconData(int icon, String fontFamily, String fontPackage) {
    return IconData(icon, fontFamily: fontFamily, fontPackage: fontPackage);
  }
}

class IconCard {
  final int id;
  final String tag;
  final int iconCodePoint;

  IconCard({required this.id, required this.tag, required this.iconCodePoint});

  factory IconCard.fromYaml(YamlMap yaml) {
    return IconCard(
        id: yaml['id'], tag: yaml['tag'], iconCodePoint: yaml['iconCodePoint']);
  }
}

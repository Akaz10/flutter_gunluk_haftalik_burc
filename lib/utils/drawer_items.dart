import 'package:flutter/material.dart';
import 'package:flutter_weekly_horoscope_app/models/drawer_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerItems{
  static const home = DrawerItem(title: 'Burç Yorumları', icon: Icons.all_inclusive);
  static const explore = DrawerItem(title: 'Yükselen Burç Hesaplama', icon: Icons.explore);
  static const favorites = DrawerItem(title: 'Burç Uyumu', icon: Icons.favorite);
  static const messages = DrawerItem(title: 'Kahve Falı     (Yakında)', icon: Icons.notifications);
  static const settings = DrawerItem(title: 'Mesajlar', icon: Icons.mail);

  static final List<DrawerItem> all = [
    home,
    explore,
    favorites,
    messages,
    settings,
  ];
}
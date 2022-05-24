import 'package:flutter/material.dart';
import 'package:flutter_weekly_horoscope_app/models/drawer_item.dart';
import 'package:flutter_weekly_horoscope_app/utils/drawer_items.dart';

class DrawerWidget extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelectedItem;

  const DrawerWidget({Key? key, required this.onSelectedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  buildDrawerItems(context);

  }
  Widget buildDrawerItems(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: DrawerItems.all.map((item) => ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      leading: Icon(item.icon, color: Colors.white,),
      title: Text(item.title,style: TextStyle(color: Colors.white, fontSize: 18),),
      onTap: () =>  onSelectedItem(item),
    )).toList(),
  );
}
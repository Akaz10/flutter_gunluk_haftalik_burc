import 'package:flutter/material.dart';
import 'package:flutter_weekly_horoscope_app/burc_listesi.dart';
import 'package:flutter_weekly_horoscope_app/burc_uyumu.dart';
import 'package:flutter_weekly_horoscope_app/kahve_fali.dart';
import 'package:flutter_weekly_horoscope_app/mesajlar.dart';
import 'package:flutter_weekly_horoscope_app/models/drawer_item.dart';
import 'package:flutter_weekly_horoscope_app/widget/drawer_widget.dart';
import 'package:flutter_weekly_horoscope_app/yukselen_hesapla.dart';
import 'utils/drawer_items.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Günlük - Haftalık Burç Yorumu",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Color(0xFF181828),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static late double xOffset;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawerOpen;
  DrawerItem item = DrawerItems.home;
  bool isDragging = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    closeDrawer();
  }

  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      });

  void openDrawer() => setState(() {
        xOffset = 220;
        yOffset = 150;
        scaleFactor = 0.6;
        isDrawerOpen = true;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(children: [
        buildDrawer(),
        buildPage(),
      ]),
    );
  }
  Widget buildDrawer() => SafeArea(child: Container(
    padding: EdgeInsets.only(top: 20),
    width: xOffset,
    child: DrawerWidget(
      onSelectedItem: (item) {
        setState(() => this.item = item);
        closeDrawer();
      },
    ),
  ));

  Widget buildPage() {
    return WillPopScope(
        onWillPop: () async {
          if (isDrawerOpen) {
            closeDrawer();

            return false;
          } else {
            return true;
          }
        },
        child: GestureDetector(
          onTap: closeDrawer,
          onHorizontalDragStart: (details) => isDragging = true,
          onHorizontalDragUpdate: (details) {
            if (!isDragging) return;

            const delta = 1;
            if (details.delta.dx > delta) {
              openDrawer();
            } else if (details.delta.dx < -delta) {
              closeDrawer();
            }
            isDragging = false;
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor),
            child: AbsorbPointer(
                absorbing: isDrawerOpen,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
                    child: Container(
                      color: isDrawerOpen
                          ? Colors.white12
                          : Theme.of(context).primaryColor,
                      child: getDrawerPage(),
                    ))),
          ),
        )
    );
  }

  Widget getDrawerPage() {
    switch(item) {
      case DrawerItems.explore:
        return YukselenHesapla(openDrawer: openDrawer);

      case DrawerItems.favorites:
        return BurcUyumu(openDrawer: openDrawer);

      case DrawerItems.messages:
        return KahveFali(openDrawer: openDrawer);

      case DrawerItems.settings:
        return Mesajlar(openDrawer: openDrawer);

      case DrawerItems.home:
      default:
        return BurcListesi(openDrawer: openDrawer);
    }
  }

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weekly_horoscope_app/burc_detay.dart';
import 'package:flutter_weekly_horoscope_app/models/burc.dart';
import 'package:flutter_weekly_horoscope_app/utils/strings.dart';
import 'package:flutter_weekly_horoscope_app/widget/drawer_menu_widget.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';


class YukselenHesapla extends StatefulWidget {
  final VoidCallback openDrawer;

  const YukselenHesapla({Key? key, required this.openDrawer}) : super(key: key);

  @override
  State<YukselenHesapla> createState() => _YukselenHesaplaState();
}

class _YukselenHesaplaState extends State<YukselenHesapla> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFF181828),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0xFF181828),
        elevation: 0,
        centerTitle: true,
        title: Text("Yükselen Burç Hesaplama"),
        leading: DrawerMenuWidget(onClicked: widget.openDrawer),
      ),
      body: SafeArea(
        child: Container(
          child: WebView(
            initialUrl: "https://yukselen-burc.hesaplama.net",
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      )
    );
  }
}

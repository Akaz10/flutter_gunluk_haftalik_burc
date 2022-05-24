import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weekly_horoscope_app/burc_uyumu_sonuc.dart';
import 'package:flutter_weekly_horoscope_app/widget/drawer_menu_widget.dart';

class KahveFali extends StatelessWidget {
  final VoidCallback openDrawer;
  const KahveFali({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: DrawerMenuWidget(onClicked: openDrawer),
    ),
    body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("ÇOK YAKINDA",style: TextStyle(fontSize: 48,fontWeight: FontWeight.bold,color: Colors.white54),),
            )
          ],
        ),
      ),
    )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_weekly_horoscope_app/burc_detay.dart';
import 'package:flutter_weekly_horoscope_app/burc_listesi.dart';

void main () => runApp(MyApp());



class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Burç Rehberi",
      debugShowCheckedModeBanner: false,

      initialRoute: "/burcListesi",

      routes: {
        "/" : (context) => BurcListesi(),
        "/burcListesi" : (context) => BurcListesi(),

      },

      onGenerateRoute: (RouteSettings settings){
        List<String> pathElemanlari = settings.name!.split("/");   // / burcDetay /1

        if(pathElemanlari[1]== 'burcDetay'){
          return MaterialPageRoute(builder: (context) => BurcDetay(int.parse(pathElemanlari[2])));
        }
        return null;
      },
      //home: BurcListesi(),
    );
  }
}
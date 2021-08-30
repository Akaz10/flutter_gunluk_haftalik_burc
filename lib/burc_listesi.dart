import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weekly_horoscope_app/burc_detay.dart';
import 'package:flutter_weekly_horoscope_app/models/burc.dart';
import 'package:flutter_weekly_horoscope_app/utils/strings.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';


class BurcListesi extends StatelessWidget {
  static List<Burc>? tumBurclar;

  @override
  Widget build(BuildContext context) {

    tumBurclar = veriKaynaginiHazirla();

    return Scaffold(
      body: listeyiHazirla(),
      backgroundColor: Color(0xFF181828),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> burclar = [];

    for (int i = 0; i < 12; i++) {
      String kucukResim = Strings.BURC_ADLARI[i].toLowerCase() +
          "${i + 1}.png"; // Koc -> koc1.png
      String buyukResim = Strings.BURC_ADLARI[i].toLowerCase() +
          "_buyuk" +
          "${i + 1}.png"; //Koc-> koc_buyuk1.png

      Burc eklenecekBurc = Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          kucukResim,
          buyukResim);
      burclar.add(eklenecekBurc);
    }
    return burclar;
  }

  Widget listeyiHazirla() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              child: Image.asset("images/main.PNG"),
              height: 100,
              width: 100,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return tekSatirBurc(context, index);
              },
              itemCount: tumBurclar!.length,
            ),
          ],
        ),
      ),
    );
  }

  Widget tekSatirBurc(BuildContext context, int index) {
    Burc oanListeyeEklenenBurc = tumBurclar![index];

    return InkWell(
      onTap: ()=> Navigator.pushNamed(context, "/burcDetay/$index"),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white70, width: 2),
            color: Color(0xFF181828),
          ),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 15,
              ),
              Opacity(
                  opacity: 1,
                  child: Image.asset(
                    "images/" + oanListeyeEklenenBurc.burccKucukResim!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                  )),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      oanListeyeEklenenBurc.burccAdi!,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(oanListeyeEklenenBurc.burccTarihi!,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white38))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

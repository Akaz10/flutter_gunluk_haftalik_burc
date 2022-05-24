import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weekly_horoscope_app/burc_listesi.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:convert' show utf8;

class BurcUyumuSonuc extends StatefulWidget {
  String? gelenValue;
  String? gelenValue2;

  BurcUyumuSonuc(this.gelenValue, this.gelenValue2);

  @override
  _BurcUyumuSonucState createState() => _BurcUyumuSonucState();
}

class _BurcUyumuSonucState extends State<BurcUyumuSonuc> {
  String? uyumText;
  String? ask;
  String? arkadaslik;
  String? isHayati;

  Future burcUyumu() async {
    var text = "";
    var url1 = widget.gelenValue!.toLowerCase();
    var url2 = widget.gelenValue2!.toLowerCase();
    var url = "https://www.milliyet.com.tr/ask-uyumu/$url1-$url2-burc-uyumu/";
    final response = await http.Client().get(Uri.parse(url));
    if (response.statusCode == 200) {
      var document = parse(response.body);
      var link = document
          .getElementsByClassName('compatibility-result__content-inner');
      for (var i in link) {
        text = text + i.text;
      }
      uyumText = text.split('UYUM')[0];
      ask = text.split('%')[1].substring(0, 2);
      arkadaslik = text.split('%')[2].substring(0, 2);
      isHayati = text.split('%')[3].substring(1, 3);
    } else {
      throw Exception();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    burcUyumu().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181828),//Color(0xFF2F0000),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: uyumText == null
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width / 3 - 1,
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.favorite,
                                          size: 130,
                                          color: Colors.white70,
                                        ),
                                      ),

                                    ],
                                  ),
                                  Text(
                                    "Aşk",
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    "%$ask",
                                    style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 40,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              )),
                          Container(
                            width: MediaQuery.of(context).size.width / 3 - 1,
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Icon(
                                      Icons.supervisor_account_sharp,
                                      size: 150,
                                      color: Colors.white70,
                                    ), //account_box

                                  ],
                                ),
                                Text("Arkadaşlık",
                                    style: TextStyle(color: Colors.white70)),
                                SizedBox(height: 10,),
                                Text(
                                  "%$arkadaslik",
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3 - 1,
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.work,
                                        size: 130,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                                Text("İş Hayatında",
                                    style: TextStyle(color: Colors.white70)),
                                SizedBox(height: 10,),
                                Text(
                                  "%$isHayati",
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w900),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "   $uyumText",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white60,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

//link.text.toString().split(' ')
//link.text.toString().split(' ')[2].split('%')[1].substring(0,2)

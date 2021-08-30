import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weekly_horoscope_app/burc_listesi.dart';
import 'models/burc.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


class BurcDetay extends StatefulWidget {
  int? gelenIndex;

  BurcDetay(this.gelenIndex);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay>
    with SingleTickerProviderStateMixin {
  Burc? secilenBurc;
  TabController? _tabController;
  String? gunlukBurcYorum;
  String? haftalikBurcYorum;
  String? aylikBurcYorum;
  String? dateTr;



  Future gunlukBurcGetir() async {
    var url;
    if (secilenBurc!.burccAdi == "KOC") {
      url = "https://www.hurriyet.com.tr/mahmure/astroloji/koc-burcu/";
    } else if (secilenBurc!.burccAdi == "BOGA") {
      url = "https://www.hurriyet.com.tr/mahmure/astroloji/boga-burcu/";
    } else if (secilenBurc!.burccAdi == "IKIZLER") {
      url = "https://www.hurriyet.com.tr/mahmure/astroloji/ikizler-burcu/";
    } else if (secilenBurc!.burccAdi == "YENGEC") {
      url = "https://www.hurriyet.com.tr/mahmure/astroloji/yengec-burcu/";
    } else if (secilenBurc!.burccAdi == "ASLAN") {
      url = "https://www.hurriyet.com.tr/mahmure/astroloji/aslan-burcu/";
    } else if (secilenBurc!.burccAdi == "BASAK") {
      url = "https://www.hurriyet.com.tr/mahmure/astroloji/basak-burcu/";
    } else if (secilenBurc!.burccAdi == "TERAZI") {
      url = "https://www.hurriyet.com.tr/mahmure/astroloji/terazi-burcu/";
    } else if (secilenBurc!.burccAdi == "AKREP") {
      url = "https://www.hurriyet.com.tr/mahmure/astroloji/akrep-burcu/";
    } else if (secilenBurc!.burccAdi == "YAY") {
      url = "https://www.hurriyet.com.tr/mahmure/astroloji/yay-burcu/";
    } else if (secilenBurc!.burccAdi == "OGLAK") {
      url = "https://www.hurriyet.com.tr/mahmure/astroloji/oglak-burcu/";
    } else if (secilenBurc!.burccAdi == "KOVA") {
      url = "https://www.hurriyet.com.tr/mahmure/astroloji/kova-burcu/";
    } else if (secilenBurc!.burccAdi == "BALIK") {
      url = "https://www.hurriyet.com.tr/mahmure/astroloji/balik-burcu/";
    }
    final response = await http.Client().get(Uri.parse(url));
    if (response.statusCode == 200) {
      var document = parse(response.body);
      var link =
          document.getElementsByClassName('horoscope-detail-tab-content')[0];
      return link.text.toString();
    } else {
      throw Exception();
    }
  }

  Future haftalikBurcGetir() async {
    var url;
    if (secilenBurc!.burccAdi == "KOC") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/koc-burcu-haftalik-yorum/";
    } else if (secilenBurc!.burccAdi == "BOĞA") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/boga-burcu-haftalik-yorum/";
    } else if (secilenBurc!.burccAdi == "IKIZLER") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/ikizler-burcu-haftalik-yorum/";
    } else if (secilenBurc!.burccAdi == "YENGEC") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/yengec-burcu-haftalik-yorum/";
    } else if (secilenBurc!.burccAdi == "ASLAN") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/aslan-burcu-haftalik-yorum/";
    } else if (secilenBurc!.burccAdi == "BASAK") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/basak-burcu-haftalik-yorum/";
    } else if (secilenBurc!.burccAdi == "TERAZI") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/terazi-burcu-haftalik-yorum/";
    } else if (secilenBurc!.burccAdi == "AKREP") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/akrep-burcu-haftalik-yorum/";
    } else if (secilenBurc!.burccAdi == "YAY") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/yay-burcu-haftalik-yorum/";
    } else if (secilenBurc!.burccAdi == "OGLAK") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/oglak-burcu-haftalik-yorum/";
    } else if (secilenBurc!.burccAdi == "KOVA") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/kova-burcu-haftalik-yorum/";
    } else if (secilenBurc!.burccAdi == "BALIK") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/balik-burcu-haftalik-yorum/";
    }
    final response = await http.Client().get(Uri.parse(url));
    if (response.statusCode == 200) {
      var document = parse(response.body);
      var link =
          document.getElementsByClassName('horoscope-detail-tab-content')[0];
      return link.text.toString();
    } else {
      throw Exception();
    }
  }

  Future aylikBurcGetir() async {
    var url;
    if (secilenBurc!.burccAdi == "KOC") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/koc-burcu-aylik-yorum/";
    } else if (secilenBurc!.burccAdi == "BOGA") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/boga-burcu-aylik-yorum/";
    } else if (secilenBurc!.burccAdi == "IKIZLER") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/ikizler-burcu-aylik-yorum/";
    } else if (secilenBurc!.burccAdi == "YENGEC") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/yengec-burcu-aylik-yorum/";
    } else if (secilenBurc!.burccAdi == "ASLAN") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/aslan-burcu-aylik-yorum/";
    } else if (secilenBurc!.burccAdi == "BASAK") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/basak-burcu-aylik-yorum/";
    } else if (secilenBurc!.burccAdi == "TERAZI") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/terazi-burcu-aylik-yorum/";
    } else if (secilenBurc!.burccAdi == "AKREP") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/akrep-burcu-aylik-yorum/";
    } else if (secilenBurc!.burccAdi == "YAY") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/yay-burcu-aylik-yorum/";
    } else if (secilenBurc!.burccAdi == "OGLAK") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/oglak-burcu-aylik-yorum/";
    } else if (secilenBurc!.burccAdi == "KOVA") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/kova-burcu-aylik-yorum/";
    } else if (secilenBurc!.burccAdi == "BALIK") {
      url =
          "https://www.hurriyet.com.tr/mahmure/astroloji/balik-burcu-aylik-yorum/";
    }
    final response = await http.Client().get(Uri.parse(url));
    if (response.statusCode == 200) {
      var document = parse(response.body);
      var link =
          document.getElementsByClassName('horoscope-detail-tab-content')[0];
      return link.text.toString();
    } else {
      throw Exception();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secilenBurc = BurcListesi.tumBurclar![widget.gelenIndex!];
    _tabController = TabController(length: 3, vsync: this);
    _tabController!.addListener(() => setState(() {}));
    //_istek();
    gunlukBurcGetir().then((value) {
      gunlukBurcYorum = value;
      setState(() {});
    });
    haftalikBurcGetir().then((value) {
      haftalikBurcYorum = value;
      setState(() {});
    });
    aylikBurcGetir().then((value) {
      aylikBurcYorum = value;
      setState(() {});
    });
    initializeDateFormatting();
    DateTime now = DateTime.now();
    dateTr = DateFormat.MMMEd('tr').format(now);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
/*      appBar: AppBar(
        bottom: TabBar(controller: _tabController, tabs: [
          Tab(
            text: "Günlük",
          ),
          Tab(
            text: "Haftalık",
          ),
          Tab(
            text: "Aylık",
          ),
        ]),
      ),*/
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 400,
              backgroundColor: Color(0xFF181828),
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 150,
                        backgroundImage: AssetImage(
                            "images/" + secilenBurc!.burccBuyukResim),
                      )
                    ],
                  ),
                ),
                title: Text(
                  secilenBurc!.burccAdi!,
                  style: TextStyle(color: Colors.white60),
                ),
                centerTitle: true,
                titlePadding: EdgeInsets.all(50),
              ),
              bottom: TabBar(
                  indicatorColor: Colors.white60,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Colors.white60,
                  labelColor: Colors.white60,
                  controller: _tabController,
                  labelStyle:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  tabs: [
                    Tab(
                      text: "GÜNLÜK",
                    ),
                    Tab(
                      text: "HAFTALIK",
                    ),
                    Tab(
                      text: "AYLIK",
                    ),
                  ]),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              color: Color(0xFF181828),
              child:  Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white60,
                            ),
                            children: [
                      TextSpan(
                          text: '   $dateTr - ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white70)),
                      TextSpan(text: gunlukBurcYorum),
                    ]))),
              ),
            ),
            Container(
              color: Color(0xFF181828),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Center(
                      child: Text(
                    "   $haftalikBurcYorum",
                    style: TextStyle(fontSize: 22, color: Colors.white60),
                  )),
                ),
              ),
            ),
            Container(
              color: Color(0xFF181828),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Center(
                      child: Text(
                    "   $aylikBurcYorum",
                    style: TextStyle(fontSize: 22, color: Colors.white60),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

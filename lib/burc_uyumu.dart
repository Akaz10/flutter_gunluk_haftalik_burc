import 'package:flutter/material.dart';
import 'package:flutter_weekly_horoscope_app/burc_uyumu_sonuc.dart';
import 'package:flutter_weekly_horoscope_app/widget/drawer_menu_widget.dart';

class BurcUyumu extends StatefulWidget {
  final VoidCallback openDrawer;

  const BurcUyumu({Key? key, required this.openDrawer}) : super(key: key);

  @override
  _BurcUyumuState createState() => _BurcUyumuState();
}

class _BurcUyumuState extends State<BurcUyumu> {
  static final List<String> items = <String>[
    "Koc",
    "Boga",
    "İkizler",
    "Yengec",
    "Aslan",
    "Basak",
    "Terazi",
    "Akrep",
    "Yay",
    "Oglak",
    "Kova",
    "Balik"
  ];
  String value = items.first;
  String value2 = items.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181828),//Color(0xFF2F0000),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: DrawerMenuWidget(onClicked: widget.openDrawer),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5,
                child: Center(
                  child: Text(
                    "BURÇ UYUMU",
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.white54,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(27, 0 ,0 ,0),
                            child: Text(
                              "ERKEK",
                              style: TextStyle(
                                fontSize: 24,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          buildDropdown(),
                        ],
                      ),
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/gender2.png"),
                              fit: BoxFit.contain)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(27, 0 ,0 ,0),
                            child: Text(
                              "KADIN",
                              style: TextStyle(
                                fontSize: 24,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          buildDropdown2(),
                        ],
                      ),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/gender.png"),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BurcUyumuSonuc(value, value2))),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0.0, 25.0),
                          blurRadius: 30.0,
                          color: Colors.black12)
                    ],
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 330,
                        padding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 125),
                        child: Text("HESAPLA",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        decoration: BoxDecoration(
                            color: Color(0xFF222230),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(88),
                                topLeft: Radius.circular(88),
                                bottomRight: Radius.circular(200))),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdown() => Container(
        width: 200,
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white70, width: 2),
        ),
        child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
          dropdownColor: Color(0xFF181828),//Color(0xFF2F0000),
          value: value,
          items: items
              .map((item) => DropdownMenuItem<String>(
                    child: Text(
                      item,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    value: item,
                  ))
              .toList(),
          onChanged: (value) => setState(() {
            this.value = value!;
          }), //current
        )),
      );

  Widget buildDropdown2() => Container(
        width: 200,
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white70, width: 2),
        ),
        child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
          dropdownColor: Color(0xFF181828),
          value: value2,
          items: items
              .map((item) => DropdownMenuItem<String>(
                    child: Text(
                      item,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    value: item,
                  ))
              .toList(),
          onChanged: (value) => setState(() {
            this.value2 = value!;
          }), //current
        )),
      );
}

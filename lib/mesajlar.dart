import 'package:flutter/material.dart';
import 'package:flutter_weekly_horoscope_app/widget/drawer_menu_widget.dart';

class Mesajlar extends StatefulWidget {
  final VoidCallback openDrawer;
  const Mesajlar({Key? key, required this.openDrawer}) : super(key: key);

  @override
  _MesajlarState createState() => _MesajlarState();
}

class _MesajlarState extends State<Mesajlar> with TickerProviderStateMixin {
  TabController? _tabController;
  var falSayisi;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController!.addListener(() => setState(() {}));
    falSayisi = 5;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: DrawerMenuWidget(onClicked: widget.openDrawer),
      ),
      body: Center(
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
          /*
          Container(child: ListView.builder(itemBuilder: (context,index){
            return Card(
              margin: EdgeInsets.all(8),
              color:  Colors.black45,
              shadowColor: Colors.black45,
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                  child: Icon(Icons.mail),
                ),

                title: Text("Kahve Falınız"),
                subtitle: Text("Tarih"),
                trailing: Icon(Icons.chevron_right_outlined),
                onTap: () {},
              ),
            );
         },itemCount: falSayisi,)),
*/
    );
  }
}

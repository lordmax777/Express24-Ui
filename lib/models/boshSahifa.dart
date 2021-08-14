import 'package:express24/bottomlar/market.dart';
import 'package:express24/bottomlar/profile.dart';
import 'package:express24/bottomlar/searchPage.dart';
import 'package:express24/bottomlar/shopPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  int selectedIndex = 0;
  List<Widget>? pageList;
  MainPage? mainPage;
  SearchPage? searchPage;
  ShopPage? shopPage;
  Profile? settingsPage;

  var keymain = PageStorageKey("page_main");
  var keySearch = PageStorageKey("page_sorage");
  var keyShop = PageStorageKey("page_shop");
  var keysettings = PageStorageKey("page_settings");
  int count = 0;
  TabController? tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 2,);
    mainPage = MainPage(keymain);
    searchPage = SearchPage(keySearch);
    shopPage = ShopPage(keyShop);
    settingsPage = Profile(keysettings);
    pageList = [mainPage!,searchPage!, shopPage!, settingsPage!];
  }
  // Container(
  //   padding: EdgeInsets.only(top: 10.0),
  //   height: 70.0,
  //   color: Colors.yellow,
  //   child: InkWell(
  //     splashColor: Colors.grey,
  //     child: ListTile(
  //       title: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text("Delivery address"),
  //           Icon(Icons.keyboard_arrow_down_outlined),
  //         ],
  //       ),
  //       subtitle: Text("             Chilonzor Rayon, Chilonzor 9 kvartal, 1"),
  //     ),
  //     onTap: (){},
  //   ),
  // ),
  // Divider(height: 0.0, thickness: 0.6,),
  // Container(
  //   //margin: EdgeInsets.only(left: 30.0),
  //   height: 55.0,
  //   child: Row(
  //     children: [
  //       Container(
  //         decoration: BoxDecoration(
  //           border: Border(
  //             bottom: BorderSide(width: 2.5, color: Colors.yellow),
  //           ),
  //         ),
  //         alignment: Alignment.center,
  //         width: 192.0,
  //         child: InkWell(
  //           child: Text("Restaurants", style: TextStyle(fontSize: 18.0),),
  //           onTap: (){},
  //         ),
  //       ),
  //       Container(
  //         alignment: Alignment.center,
  //         width: 192.0,
  //         child: InkWell(
  //           child: Text("Market", style: TextStyle(fontSize: 18.0),),
  //           onTap: (){
  //             Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
  //           },
  //         ),
  //       ),
  //     ],
  //   ),
  // ),,
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList![selectedIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
          cardColor: Colors.black,
        ),
        child: bottomMenu(),
      ),
    );
  }
  Widget bottomMenu(){
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.black),
            label: "Home",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.search,color: Colors.black),
            label: "Search",),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined,color: Colors.black),
            label: "My orders",),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline,color: Colors.black,),
            label: "Profile",),
      ],
      type: BottomNavigationBarType.shifting,
      currentIndex: selectedIndex,
      onTap: (selement) {
        setState(() {
          selectedIndex = selement;
        });
      },
    );
  }
}


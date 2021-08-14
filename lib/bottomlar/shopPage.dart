import 'package:flutter/material.dart';

List<Widget> restaurant =[];
List<Widget> market =[];
List<Widget> history =[];
List<int> myprise = [0];
List<int> myprisela = [0];
int a = 0;
int ab = 0;
int c = 0;

class ShopPage extends StatefulWidget {
  const ShopPage(PageStorageKey<String> keyShop, {Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> with TickerProviderStateMixin{
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      vsync: this,
      length: 3,
    );
  }
  @override
  Widget build(BuildContext context) {
    for (int i in myprise){
      a = a + i;
    }
    for (int it in myprisela){
      ab = ab + it;
    }

    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0, bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: Colors.red,
              onPressed: (){
              setState(() {
                if(c == 0){
                  restaurant.forEach((e1) => history.add(e1));
                  a = 0;
                  myprise = [0];
                  restaurant = [];
                }if(c == 1){
                  market.forEach((e1) => history.add(e1));
                  ab = 0;
                  myprisela = [0];
                  market = [];
                }if(c == 2){
                  history = [];
                }
              });
            }, child: Text("Clear"),),
            SizedBox(width: 40.0,),
            FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: Colors.green,
              onPressed: (){
            }, child: Text("Buy"),),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: Text("My orders", style: TextStyle(color: Colors.black),),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(
            color: Colors.white,
            child: tabBar(),
          ),
        ),
      ),
      body: tapBarView(),
    );
  }
  TabBarView tapBarView(){
    return TabBarView(
      controller: tabController,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[200],
          child: ListView(
            children: restaurant,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[200],
          child: ListView(
            children: market,
            ),
          ),
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[200],
          child: ListView(
            children: history,
          )
        ),
      ],
    );
  }
  TabBar tabBar() {
    return TabBar(
      isScrollable: false,
      controller: tabController,
      indicatorColor: Colors.black,
      indicatorWeight: 3.0,
      onTap: (e){
        setState(() {
          c = e;
          print("${c}");
        });
      },
      tabs: [
        Container(
          color: Colors.white,
          height: 50.0,
          width: MediaQuery.of(context).size.width / 4,
          child: Tab(
            child: Text(
              "Restaurants",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width / 4,
          child: Tab(
            child: Text(
              "Market",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width / 3,
          child: Tab(
            child: Text(
              "History",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}

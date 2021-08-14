import 'package:express24/bottomlar/shopPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage(PageStorageKey<String> keymain);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  List<Color> colors = List.generate(12, (index) => index != 0 ? Colors.white : Colors.yellow);
  List<Color> colors1 = List.generate(12, (index) => index != 0 ? Colors.white : Colors.yellow);
  int selectedIndex = 0;
  int selectedIndex1 = 0;
  int count = 0;
  int count1 = 0;
  TabController? tabController;
  List favourite = List.generate(12, (index) => []);
  List favourite1 = List.generate(12, (index) => []);
  List sonlar = List.generate(12, (i) {
    return List.generate(Malumotlar.asiasoni[i].length, (index) => 0);
  });
  List sonlar1 = List.generate(12, (i) {
    return List.generate(Malumotlar.Narxlar[i].length, (index) => 0);
  });

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Delivery address",
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Text(
                    "Chilonzor Rayon, Chilonzor 8 kvartal, 1",
                    style: TextStyle(fontSize: 12.0, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {},
        ),
        backgroundColor: Colors.yellow,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: Material(
            color: Colors.white,
            child: tabBar(),
          ),
        ),
      ),
      body: tabBarview(),
    );
  }

  TabBarView tabBarview() {
    Widget yasama2(String name, var price, var soni, String image){
      return Card(
        child: ListTile(
          leading: Image.asset(image),
          title: Text(name),
          trailing: Text(price.toString()),
          subtitle: Text(soni.toString()),
        ),
      );
    }
    Widget yasama3(String name, var price, var soni, String image){
      return Card(
        child: ListTile(
          leading: Image.asset(image),
          title: Text(name),
          trailing: Text("${price.toString()} \$"),
          subtitle: Text(soni.toString()),
        ),
      );
    }
    return TabBarView(controller: tabController, children: [
      Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Column(
                        children: [
                          Container(
                            height: 140.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0,
                                      top: 25.0,
                                      bottom: 20.0,
                                      right: 5.0),
                                  child: GestureDetector(
                                    child: Container(
                                      width: 155.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                Malumotlar.rasimlar[index]),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              Malumotlar.malumotol[index],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GestorClass(index)));
                                    },
                                  ),
                                );
                              },
                              itemCount: 6,
                            ),
                          ),
                          Container(
                            height: 120.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 10.0, right: 5.0),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          width: 80.0,
                                          height: 80.0,
                                          decoration: BoxDecoration(
                                            color: colors[index],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Image.asset(
                                              Malumotlar.rasimcha[index]),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            colors = [];
                                            colors=List.generate(12, (index) => Colors.white);
                                            colors[index] = Colors.yellow;
                                            count = index;
                                          });
                                        },
                                      ),
                                      Text(
                                        Malumotlar.ikki[index],
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 10.0, bottom: 5.0),
                            child: Container(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Free Delivery",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                          Container(
                            height: 275.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 10.0, right: 5.0),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          width: 150.0,
                                          height: 150.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    Malumotlar.rasmi[index]),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Malumotcha(index)));

                                        },
                                      ),
                                      Container(
                                          width: 140.0,
                                          height: 45.0,
                                          child: Text(
                                            Malumotlar.uch[index],
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      SizedBox(height: 10.0,),
                                      Container(
                                          width: 140.0,
                                          child: Text("Express dokon")),
                                      Container(
                                          width: 140.0,
                                          child: Text(Malumotlar.tort[index].toString()+" so`m"))
                                    ],
                                  ),
                                );
                              },
                              itemCount: 5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                            child: Container(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Restaurants",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                        ],
                      );
                    }
                    return Text("");
                  },
                  separatorBuilder: (context, index) {
                    Widget yasamaAssalom(String nom, String kichiknom, var son, var price, String rasim){
                      return Scaffold(
                        body: CustomScrollView(
                          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics(),),
                          slivers: [
                            SliverAppBar(
                              pinned: true,
                              elevation: 6.0,
                              stretch: true,
                              snap: true,
                              floating: true,
                              title: Text(nom),
                              centerTitle: true,
                              expandedHeight: 300.0,
                              flexibleSpace: FlexibleSpaceBar(
                                background: Image.asset(Malumotlar.Cockies[count][index], fit: BoxFit.cover,),
                                stretchModes: [
                                  StretchMode.zoomBackground,
                                  StretchMode.fadeTitle,
                                ],
                              ),
                            ),
                            SliverList(
                                delegate: SliverChildListDelegate(
                                  [
                                    Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15.0),
                                              color: Colors.grey.withOpacity(0.5),
                                            ),
                                            height: 55.0,
                                            width: 160.0,
                                              child: Text(kichiknom,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),)),
                                          Text(son.toString()),
                                          Text(price.toString()),
                                          ElevatedButton(
                                              onPressed: (){
                                                setState(() {
                                                  sonlar[count][index] += 1;
                                                  favourite[count][index] = false;
                                                });
                                              },
                                              child: Icon(Icons.add),),
                                        ],
                                      ),
                                    )
                                  ]
                                ),
                            ),
                          ],
                        )
                      );
                    }
                    favourite[count].add(false);
                    return Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(Malumotlar.Cockies[count][index]),
                                    fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.circular(5.0)),
                            padding: EdgeInsets.all(10.0),
                            height: MediaQuery.of(context).size.height / 3.5,
                            width: 380.0,
                            margin: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  !favourite[count][index] ? Icons.favorite_border : Icons.favorite,
                                  color: !favourite[count][index] ? Colors.white : Colors.redAccent,
                                  size: 40.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height / 11.0,
                                      width: MediaQuery.of(context).size.width / 5.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/2222.png"),
                                        ),
                                        color: Colors.white.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                                      height: MediaQuery.of(context).size.height / 22.0,
                                      width: MediaQuery.of(context).size.width / 5.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(
                                          20.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.star_border_outlined,
                                          ),
                                          Text("${sonlar[count][index]}", style: TextStyle(fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                    ),
                                    // ElevatedButton(
                                    //     onPressed: (){
                                    //       sonlar[count][index] += 1;
                                    //       favourite[count][index] = true;
                                    //     },
                                    //     child: Icon(Icons.add))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              sonlar[count][index] += 1;
                                favourite[count][index] = true;
                            });
                          },
                          onLongPress: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => yasamaAssalom(
                              Malumotlar.ikki[count], Malumotlar.asiaNomi[count][index], sonlar[count][index],Malumotlar.asiasoni[count][index],Malumotlar.Cockies[count][index],
                            ),),);
                          },
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 13.0),
                              child: Row(
                                children: [
                                  Text(Malumotlar.ikki[count], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 13.0, right: 13.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(Malumotlar.asiaNomi[count][index]),
                                  Row(
                                    children: [
                                      Icon(Icons.delivery_dining_outlined),
                                      Text("${Malumotlar.asiasoni[count][index].toString()} so`m"),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                  itemCount: Malumotlar.asiaNomi[count].length + 1),
            ),
          ),
        ],
      ),
      Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Column(
                        children: [
                          Container(
                            height: 140.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0,
                                      top: 25.0,
                                      bottom: 20.0,
                                      right: 5.0),
                                  child: GestureDetector(
                                    child: Container(
                                      width: 155.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                Malumotlar.marketrasim[index]),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              Malumotlar.marketmal[index],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Iphonelar(index)));
                                    },
                                  ),
                                );
                              },
                              itemCount: 6,
                            ),
                          ),
                          Container(
                            height: 120.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 10.0, right: 5.0),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          width: 80.0,
                                          height: 80.0,
                                          decoration: BoxDecoration(
                                            color: colors1[index],
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                          child: Malumotlar.marketAB[index],
                                        ),
                                        onTap: () {
                                          setState(() {
                                            colors1 = [];
                                            colors1=List.generate(12, (index) => Colors.white);
                                            colors1[index] = Colors.yellow;
                                            count1 = index;
                                          });
                                        },
                                      ),
                                      SizedBox(height: 5.0,),
                                      Text(
                                        Malumotlar.marketA[index],
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 10.0, bottom: 5.0),
                            child: Container(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "New Market",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                          Container(
                            height: 275.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 10.0, right: 5.0),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          width: 150.0,
                                          height: 150.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    Malumotlar.phonesaim[index]),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Yasamalar3(index)));
                                        },
                                      ),
                                      Container(
                                          width: 140.0,
                                          height: 45.0,
                                          child: Text(
                                            Malumotlar.phonemal[index],
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      SizedBox(height: 20.0,),
                                      Container(
                                          width: 140.0,
                                          child: Text(Malumotlar.phonemalA[index])),
                                      Container(
                                          width: 140.0,
                                          child: Text(Malumotlar.phonenarx[index].toString()+" \$", style: TextStyle(fontWeight: FontWeight.bold),)),
                                    ],
                                  ),
                                );
                              },
                              itemCount: 5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                            child: Container(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Market",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                        ],
                      );
                    }
                    return Text("");
                  },
                  separatorBuilder: (context, index) {
                    Widget yasamaAssalomman(String nom, String kichiknom, var son, var price, String rasim){
                      return Scaffold(
                          body: CustomScrollView(
                            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics(),),
                            slivers: [
                              SliverAppBar(
                                pinned: true,
                                elevation: 6.0,
                                stretch: true,
                                snap: true,
                                floating: true,
                                title: Text(nom),
                                centerTitle: true,
                                expandedHeight: 300.0,
                                flexibleSpace: FlexibleSpaceBar(
                                  background: Image.asset(Malumotlar.Cockiesrasim[count1][index], fit: BoxFit.cover,),
                                  stretchModes: [
                                    StretchMode.zoomBackground,
                                    StretchMode.fadeTitle,
                                  ],
                                ),
                              ),
                              SliverList(
                                  delegate: SliverChildListDelegate(
                                      [
                                        Container(
                                          child: Column(
                                            children: [
                                              Text(kichiknom),
                                              Text(son.toString()),
                                              Text(price.toString()),
                                            ],
                                          ),
                                        )
                                      ]
                                  ))
                            ],
                          )
                      );
                    }
                    favourite1[count1].add(false);
                    return Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(Malumotlar.Cockiesrasim[count1][index]),
                                    fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.circular(5.0)),
                            padding: EdgeInsets.all(10.0),
                            height: MediaQuery.of(context).size.height / 3.5,
                            width: 380.0,
                            margin: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  !favourite1[count1][index] ? Icons.favorite_border : Icons.favorite,
                                  color: !favourite1[count1][index] ? Colors.white : Colors.redAccent,
                                  size: 40.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height / 11.0,
                                      width: MediaQuery.of(context).size.width / 5.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/2222.png"),
                                        ),
                                        color: Colors.white.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                    ),
                                    GestureDetector(
                                      onLongPress: (){
                                        if(sonlar1[count1][index] > 0){
                                          myprisela.add(Malumotlar.Narxlar[count1][index] * sonlar1[count1][index]);
                                          market.add(yasama3(Malumotlar.Cockieslar[count1][index],Malumotlar.Narxlar[count1][index],sonlar1[count1][index], Malumotlar.Cockiesrasim[count][index]));
                                          sonlar1[count1][index] = 0;
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                                        height: MediaQuery.of(context).size.height / 22.0,
                                        width: MediaQuery.of(context).size.width / 5.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.7),
                                          borderRadius: BorderRadius.circular(
                                            20.0,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.star_border_outlined,
                                            ),
                                            Text("${sonlar1[count1][index]}", style: TextStyle(fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          onDoubleTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => yasamaAssalomman(
                              Malumotlar.marketA[count1], Malumotlar.Cockieslar[count1][index], sonlar1[count1][index],Malumotlar.Narxlar[count1][index],Malumotlar.Cockiesrasim[count1][index],
                            )));
                          },
                          onTap: (){
                            setState(() {
                              sonlar1[count1][index] += 1;
                              favourite1[count1][index] = true;
                            });
                          },
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 13.0),
                              child: Row(
                                children: [
                                  Text(Malumotlar.marketA[count1], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 13.0, right: 13.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(Malumotlar.Cockieslar[count1][index]),
                                  Row(
                                    children: [
                                      Icon(Icons.delivery_dining_outlined),
                                      SizedBox(width: 5.0,),
                                      Text("${Malumotlar.Narxlar[count1][index].toString()}  \$"),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                  itemCount: Malumotlar.Cockiesrasim[count1].length+1),
            ),
          ),
        ],
      ),
    ]);
  }

  TabBar tabBar() {
    return TabBar(
      isScrollable: false,
      controller: tabController,
      indicatorColor: Colors.yellow,
      indicatorWeight: 3.0,
      tabs: [
        Tab(
          child: Text(
            "Restaurants",
            style: TextStyle(color: Colors.black),
          ),
        ),
        Tab(
          child: Text(
            "Market",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class Malumotcha extends StatefulWidget {
  int index;
  Malumotcha(this.index);

  @override
  _MalumotchaState createState() => _MalumotchaState();
}

class _MalumotchaState extends State<Malumotcha> {
  int son = 0;
  @override
  Widget build(BuildContext context) {
    Widget yasama(String name, var price, String image, int soni){
      return Card(
        child: ListTile(
          leading: Image.asset(image),
          title: Text(name),
          trailing: Text(price.toString()),
          subtitle: Text("${soni}"),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.white,
            height: 70.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  SizedBox(
                    width: 90.0,
                  ),
                  Text("Promotions",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold, fontSize: 18.0),),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                padding: EdgeInsets.all(0),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          height: 300.0,
                          width: 400.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                  image: AssetImage(Malumotlar.rasmi[widget.index]),
                                  fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 280.0, left: 95.0),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white.withOpacity(0.8),
                            ),
                            height: 50.0,
                            width: 190.0,
                            child: Text("Narxi: ${Malumotlar.tort[widget.index]} so`m", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 5.0, bottom: 10.0),
                          child: Text(Malumotlar.uch[widget.index],style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 90.0, right: 90.0, bottom: 15.0),
                    child: Divider(height: 4.0,color: Colors.black,thickness: 2.0,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      child: Container(
                        child: Text(Malumotlar.Adrenalin[widget.index],style: TextStyle(fontSize: 16.0),),
                      ),
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.only(left: 90.0, right: 90.0, bottom: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        width: 150.0,
                        height: 60.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){
                              setState(() {
                                if(son > 0){
                                  son -= 1;
                                }
                              });
                            }, icon: Icon(Icons.exposure_minus_1_rounded,color: Colors.red,)),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                              child: Container(
                                  alignment: Alignment.center,
                                  width: 60.0,
                                  height: 50.0,
                                  child: Text("${son}", style: TextStyle(fontSize: 30.0,color: Colors.black),)),
                            ),
                            IconButton(onPressed: (){
                              setState(() {
                                son += 1;
                              });
                            },
                                icon: Icon(Icons.exposure_plus_1_sharp, color: Colors.green,)),
                          ],
                        ),
                  ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0,bottom: 5.0, top: 5.0),
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20.0)
                ),
                alignment: Alignment.center,
                height: 60.0,
                width: 400.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_shopping_cart_outlined),
                    Padding(
                      padding: const EdgeInsets.only(left: 90.0 , right: 80.0),
                      child: Text("Add to cart",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),),
                    ),
                    Text("Soni: ${son}",),
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  if(son > 0){
                    myprise.add(son * Malumotlar.tort[widget.index]);
                    restaurant.add(yasama(Malumotlar.uch[widget.index], Malumotlar.tort[widget.index], Malumotlar.rasmi[widget.index], son));
                    son = 0;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Yasamalar3 extends StatefulWidget {
  int index;
  Yasamalar3(this.index);

  @override
  _Yasamalar3State createState() => _Yasamalar3State();
}

class _Yasamalar3State extends State<Yasamalar3> {
  int son = 0;
  @override
  Widget build(BuildContext context) {
    Widget yasama3(String name, var price, String image, int soni){
      return Card(
        child: ListTile(
          leading: Image.asset(image),
          title: Text(name),
          trailing: Text(price.toString() + " \$"),
          subtitle: Text("${soni}"),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.white,
            height: 70.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  SizedBox(
                    width: 90.0,
                  ),
                  Text("Promotions",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold, fontSize: 18.0),),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                padding: EdgeInsets.all(0),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          height: 300.0,
                          width: 400.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            image: DecorationImage(
                                image: AssetImage(Malumotlar.phonesaim[widget.index]),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 280.0, left: 95.0),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white.withOpacity(0.8),
                            ),
                            height: 50.0,
                            width: 190.0,
                            child: Text("Narxi: ${Malumotlar.phonenarx[widget.index]}  \$", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 5.0, bottom: 10.0),
                          child: Text(Malumotlar.phonemalA[widget.index],style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 90.0, right: 90.0, bottom: 15.0),
                    child: Divider(height: 4.0,color: Colors.black,thickness: 2.0,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      child: Container(
                        child: Text(Malumotlar.malumotlar[widget.index],style: TextStyle(fontSize: 16.0),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 90.0, right: 90.0, bottom: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      width: 150.0,
                      height: 60.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){
                            setState(() {
                              if(son > 0){
                                son -= 1;
                              }
                            });
                          }, icon: Icon(Icons.exposure_minus_1_rounded,color: Colors.red,)),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Container(
                                alignment: Alignment.center,
                                width: 60.0,
                                height: 50.0,
                                child: Text("${son}", style: TextStyle(fontSize: 30.0,color: Colors.black),)),
                          ),
                          IconButton(onPressed: (){
                            setState(() {
                              son += 1;
                            });
                          },
                              icon: Icon(Icons.exposure_plus_1_sharp, color: Colors.green,)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0,bottom: 5.0, top: 5.0),
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20.0)
                ),
                alignment: Alignment.center,
                height: 60.0,
                width: 400.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_shopping_cart_outlined),
                    Padding(
                      padding: const EdgeInsets.only(left: 90.0 , right: 80.0),
                      child: Text("Add to cart",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),),
                    ),
                    Text("Soni: ${son}",),
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  if(son > 0){
                    myprisela.add(son * Malumotlar.phonenarx[widget.index]);
                    market.add(yasama3(Malumotlar.phonemalA[widget.index], Malumotlar.phonenarx[widget.index], Malumotlar.phonesaim[widget.index], son));
                    son = 0;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Iphonelar extends StatelessWidget {
  int i;
  Iphonelar(this.i);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Text(Malumotlar.marketmal[i],
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
              color: Colors.black),),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 280.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage(Malumotlar.marketrasim[i]),fit: BoxFit.cover
      ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        )
    ),),
              stretchModes: [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 200,
                        width: 380.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Colors.black26, width: 2.0),
                            image: DecorationImage(
                              image: NetworkImage(Malumotlar.RasmlarListi[i][index]),fit: BoxFit.cover,
                            ),
                        ),
                      ),
                    );
                  },
                  childCount: 10,
              ),
          ),
        ],
      ),
    );
  }
}

class GestorClass extends StatelessWidget {
  int b;
  GestorClass(this.b);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Text(Malumotlar.malumotol[b],
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
              color: Colors.black),),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 280.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Malumotlar.rasimlar[b]),fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  )
                ),),
              stretchModes: [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 200,
                    width: 380.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black26, width: 2.0),
                      image: DecorationImage(
                        image: NetworkImage(Malumotlar.Oybek[b][index]),fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}


class Malumotlar {
  static List<List<String>> Oybek = [
    [
      "http://allsensors.com/blog/wp-content/uploads/2018/08/85.jpg",
      "https://sarniadentistry.com/wp-content/uploads/2019/11/dentist-sarnia-500x360.jpeg",
      "https://www.daysoftheyear.com/wp-content/uploads/carbonated-beverage-with-caffeine-day.jpg",
      "https://static01.nyt.com/images/2016/08/25/upshot/25up-soda/25up-soda-articleLarge.jpg?quality=75&auto=webp&disable=upscale",
      "https://g.foolcdn.com/image/?url=https%3A%2F%2Fg.foolcdn.com%2Feditorial%2Fimages%2F510968%2Fcoca-cola-image.jpg&w=1200&h=630&op=resize",
      "https://lh3.googleusercontent.com/proxy/zLp1in0dxjaXNeN94Yb49zN_TBIDA805zhjX02olStrmmr9SelqRBWnAoYOLF7j2ZY1DtaPVOaZjfDPdNq4Mm78LYzAmW27EY5fCTR58OCXuSb-x9A",
      "https://mir-s3-cdn-cf.behance.net/projects/404/c383c0113885447.Y3JvcCwyMzk2LDE4NzQsMCwxNjY.jpg",
      "https://c8.alamy.com/comp/2FA1E5N/tyumen-russia-december-10-2020-drinks-in-aluminum-cans-of-pepsico-company-mirinda-pepsi-lipton-2FA1E5N.jpg",
      "https://i.ytimg.com/vi/yGRFjwjHm40/maxresdefault.jpg",
      "https://api.time.com/wp-content/uploads/2015/05/97055361.jpg?quality=85&w=1200&h=628&crop=1",
    ],
    [
      "https://img-9gag-fun.9cache.com/photo/aoeEZq2_460s.jpg",
      "https://www.coca-cola.com/content/dam/brands/global/coca-cola/images/coca-cola-siente-el-sabor-amigos-480x600.jpg",
      "https://assets.rbl.ms/12680667/980x.png",
      "https://www.incimages.com/uploaded_files/image/1920x1080/getty_1005364128_389765.jpg",
      "https://images.barrons.com/im-326849?width=1280&size=1",
      "https://assets.entrepreneur.com/content/3x2/2000/1613071507-GettyImages-1040144744.jpg",
      "https://cdn.c-store.com.au/wp-content/uploads/2016/12/03103351/Make-It-Perfect-Grocery-Gateways_opt-2.png",
      "https://www.coca-cola.pl/content/dam/one/pl/poznaj-nas-lepiej/nasze-dzialania/taste-the-feeling-nowa-globalna-kampania-dla-wszystkich-marek-coca-cola.jpg",
      "https://przeambitni.pl/wp-content/uploads/2015/04/marg.png",
      "https://www.coca-cola.hr/content/dam/one/hr/hr/brand-tiles/cocacola-580x580.jpg"
    ],
    [
      "https://images.media-allrecipes.com/userphotos/1140093.jpg",
      "https://static.onecms.io/wp-content/uploads/sites/9/2012/07/blog-201207-r-zimmern-cold-cucumber-soup-with-yogurt-and-dill.jpg",
      "https://irepo.primecp.com/2016/03/270712/recipe-27819_Large600_ID-1541618.jpg?v=1541618",
      "https://www.polonist.com/wp-content/uploads/2021/04/Cold-Cucumber-Soup-3-1600sq-735x735.jpg",
      "https://s3.amazonaws.com/finecooking.s3.tauntonclud.com/app/uploads/2017/04/18192035/fc59st054-01-main.jpg",
      "https://www.washingtonpost.com/rf/image_982w/2010-2019/WashingtonPost/2018/01/16/Food/Images/CoconutCurryCarrotSoup-2466.jpg",
      "https://mayihavethatrecipe.com/wp-content/uploads/2018/11/coconut-carrot-ginger-soup-facebook.jpg",
      "https://mjskitchen.com/wp-content/uploads/2015/08/SoupCantaloupeCukeH2_Web.jpg",
      "https://static01.nyt.com/images/2015/08/26/dining/26BURNER4/26BURNER4-articleLarge.jpg",
      "https://cdn.ckitchen.com/img/blog/d4980721-0b56-496a-9f5f-0aace6150b69/66eb4737-dc32-42ed-baf9-1957537c5a78_47535672_m.jpg",
    ],
    [
      "https://i2.wp.com/nourish-and-fete.com/wp-content/uploads/2020/04/everyday-italian-salad-1360px-2.jpg",
      "https://cdn.loveandlemons.com/wp-content/uploads/2020/05/chopped-salad.jpg",
      "https://www.cookingclassy.com/wp-content/uploads/2019/11/best-salad-7.jpg",
      "https://i.pinimg.com/originals/6b/1e/7a/6b1e7a46ed0dbbaefb1201d5ff255461.jpg",
      "https://cdn.loveandlemons.com/wp-content/uploads/2019/07/salad.jpg",
      "https://tmbidigitalassetsazure.blob.core.windows.net/rms3-prod/attachments/37/1200x1200/exps6498_MRR133247D07_30_5b_WEB.jpg",
      "https://www.onceuponachef.com/images/2019/07/Big-Italian-Salad.jpg",
      "https://tmbidigitalassetsazure.blob.core.windows.net/rms3-prod/attachments/37/1200x1200/exps184725_TH143195A08_06_2b.jpg",
      "https://ohsweetbasil.com/wp-content/uploads/Greek-Pasta-Salad-Oh-Sweet-Basil-3.jpg",
      "https://runningonrealfood.com/wp-content/uploads/2018/01/gluten-free-vegan-everyday-healthy-rainbow-salad-Running-on-Real-Food-6-of-10.jpg"
    ],
    [
      "https://littlefaifo.com/wp-content/uploads/2021/03/ourstory_012-6.jpg",
      "https://www.thespruceeats.com/thmb/RrP9qTWy2BbntDB6GCwWi8Yy29U=/3000x2000/filters:fill(auto,1)/UbeIceCreamHERO-ae953a4c3ede4690bd2f0ccbc104ea12.jpg",
      "https://images.herzindagi.info/image/2020/Jun/chocolate-parle-g-ice-cream.jpg",
      "https://stories.forbestravelguide.com/wp-content/uploads/2019/08/HERO-TorontoIceCream-creditBrookeLarkonUnsplash.jpg",
      "https://bigseventravel.com/wp-content/uploads/2019/07/booyah-inc.jpg",
      "https://i.pinimg.com/originals/ac/b8/15/acb8157c00c1d3c39e59eb25a5d36e4b.jpg",
      "https://i.pinimg.com/originals/77/87/3b/77873b0cb8ec50effd1d682f3e023fde.jpg",
      "https://i.pinimg.com/originals/8e/c1/5c/8ec15c9dbbdbd03ebf683c84b20a4250.jpg",
      "https://media-cdn.tripadvisor.com/media/photo-s/10/41/48/3e/crazy-vanilla-ice-cream.jpg",
      "https://s3-media1.fl.yelpcdn.com/bphoto/h0Uxgjmy4t-X37u92XnUpw/o.jpg"
    ],
    [
      "https://media.architecturaldigest.com/photos/6079f89b3d446d60232478d2/master/pass/AD0521_CARBONE_7.jpg",
      "https://www.galeriemagazine.com/wp-content/uploads/2021/06/MAIN_Carbone-Miami-Dining-Room-3-PC-Douglas-Friedman.jpg",
      "https://res.cloudinary.com/jerrick/image/upload/c_scale,f_jpg,q_auto/t0gc0a809hn50rbu6044.jpg",
      "http://cdn.cnn.com/cnnnext/dam/assets/200120171437-cnn-worlds-best-new-restaurants---des-roses-et-des-orties-toulouse2.jpg",
      "https://www.serenitycircle.com.au/wp-content/uploads/2020/05/amsterdam-restaurant-1024x680.png",
      "https://www.fodors.com/wp-content/uploads/2020/07/07_ScaryRestaurant__HERO_Brussels_4.jpg",
      "http://cdn.cnn.com/cnnnext/dam/assets/200120164908-cnn-worlds-best-new-restaurants---le-chne-04-leeu-estates-dining-room-1-1.jpg",
      "https://modernarchitectideas.com/wp-content/uploads/2020/09/Unbelievable-Underwater-Restaurants-Around-The-World.jpg",
      "https://www.connexionfrance.com/var/connexion/storage/images/_aliases/social_network_image/media/images/teddy-bears/1083665-1-eng-GB/teddy-bears.jpg",
      "https://trailsandtravel.com/wp-content/uploads/2019/02/Fords-Garage-7.jpg"
    ],
  ];

  static List<String> malumotlar = [
    """Displey   6,7 dyuymli (17 sm diagonali) Super Retina XDR displeyi True Tone bilan

Imkoniyatlar     128GB, 256GB, 512GB

Splash, suv va changga chidamli      Shisha va jarrohlik darajadagi zanglamaydigan po'latdan yasalgan dizayni, suv va changga chidamli (IP68 nominalli)

Kamera va video     Portret rejimi, chuqurlik nazorati, portret yoritgichi, Smart HDR 3 va 60 kvadrat / soatgacha bo'lgan 4K Dolby Vision HDR videokamera bilan jihozlangan uch kishilik 12 megapikselli kameralar

Old kamera     Portret rejimi, chuqurlik nazorati, portret yoritgichi va aqlli HDR 3 bilan 12MP TrueDepth old kamerasi

Quvvat va batareya      Videoni ijro etish: 20 soatgacha, Videoni ijro etish (oqim): 12 soatgacha, Ovozni tinglash: 80 soatgacha, 20 Vt yoki undan yuqori adapter (alohida sotiladi), Tez quvvat olish imkoniyati: Taxminan 30 daqiqada 50% gacha quvvat olish 20W yoki undan yuqori adapter bilan

Qutida      iOS 14 bilan ishlaydigan iPhone, USB-C dan chaqmoq kabeli, Hujjatlar

Kafolat     Dastlabki qadoqdagi ("Apple Product") Apple markali apparat mahsulotlari va aksessuarlar Bir yillik cheklangan kafolat bilan ta'minlangan. Qo'shimcha ma'lumot uchun apple.com/in/legal/warranty saytiga qarang.

Balandligi      6,33 dyuym (160,8 mm)""",
    """Display    13.3-inch (diagonal) LED-backlit Retina display with IPS technology; 2560-by-1600 native resolution at 227 pixels per inch with support for millions of colors, 16:10 aspect ratio

Processor     2.0GHz quad-core 10th-generation Intel Core i5, Turbo Boost up to 3.8GHz, with 6MB shared L3 cache

Graphics and Video Support     Intel Iris Plus Graphics 645

Charging and Expansion      Four Thunderbolt 3 (USB-C) ports with support for: Charging, DisplayPort Thunderbolt (up to 40 Gbps), USB 3.1 Gen 2 (up to 10 Gbps)

Wireless      Wi-Fi; 802.11ac Wi-Fi wireless networking; IEEE 802.11a/b/g/n compatible, Bluetooth 5.0 wireless technology

In the Box     13-inch MacBook Pro, 61W USB-C Power Adapter, USB-C Charge Cable (2 m)""",
    """Aston Martin Lagonda - bu Britaniyaning hashamatli sport avtomobillari va grand turistlarini mustaqil ishlab chiqaruvchisi . Uning salafiysi 1913 yilda Lionel Martin va Robert Bemford tomonidan tashkil etilgan . 1947 yildan Devid Braun tomonidan boshqarilgan bo'lib, u 1950 va 1960 yillarda qimmatbaho turistik avtoulovlar bilan bog'liq bo'lib, 1964 yilda " Goldfinger" filmida DB5 modelidan foydalanganidan keyin xayoliy Jeyms Bond bilan bog'liq . Ularning sport avtomobillari Britaniyaning madaniy belgisi sifatida qabul qilinadi. Aston Martin qirollik kafolatiga ega1982 yildan buyon Uels shahzodasiga avtoulovlarni etkazib beruvchi sifatida va 53 mamlakatda 160 dan ortiq avtosalonlarga ega bo'lib, uni jahon avtomobil brendiga aylantirdi. Kompaniya London fond birjasida sotiladi va FTSE 250 indeksining asoschisi hisoblanadi. 2003 yilda korxona uchun xalqaro savdoga qo'shgan ulkan hissasi uchun Qirolicha mukofotiga sazovor bo'ldi. Kompaniya o'z tarixida etti marta bankrot bo'lgan.

Uning sport avtomobillari va grand tourers qarorgohi va asosiy ishlab chiqarish bir 22-gektar (55 akr-) muassasasida bo'lgan Gaydon , Warwickshire sobiq saytida, Angliya RAF Gaydon tutash, Jaguar Land Rover Gaydon markazi. eski zavod Newport Pagnell , Buckinghamshire Aston Martin bugungi uy merosi savdo, xizmat, zaxira qismlari va qayta tiklash operatsiyalari aratilgan klassik avtomobil bo'limiga, ishlaydi. Uelsning Sent-Afan shahridagi 36 gektarlik (90 gektar) zavodda MOD Sent-Afandan uchta konvertatsiya qilingan "super-angar" mavjud.Va Aston Martinning ilk ishlab chiqarish sayt sifatida xizmat qiladi , suv , DBX. Aston Martin 2025 yilga qadar Gaydon va St Athan fabrikalarida elektr transport vositalarini qurishni rejalashtirmoqda.

Uning Formula-1 shtab-kvartirasi Silverstone-da joylashgan bo'lib , yangi 15000 kvadrat metr (160.000 kvadrat fut) inshoot 2022 yilgacha ishga tushirilishi kerak. Yangi zavod 29 gektar maydonda Silverstone sxemasi qarshisida joylashgan. Litchlake fermasida yer. Aston Martin markasi tobora ko'proq litsenziyalash orqali boshqa mahsulotlarda, shu jumladan dengiz osti kemasida, ko'chmas mulkni rivojlantirishda, va samolyotlarda ko'proq foydalanilmoqda.""",
    """Joynamoz - namoz o‘qiladigan to‘shama. Joynamoz ibodat vaqtida kishini bu dunyodan ajratuvchi omil, deb tasavvur qilinadi. Joynamoz turli matodan tayyorlanadi. Joynamozning bosh tomoniga burchak (mehrob) shakli tikilgan bo‘ladi. Katta-kichikligi har xil. Namoz o‘qishda o‘rni kelganda pokiza gilam yoki chopon, qiyiqcha kabilardan ham foydalanish mumkin. Joynamoz ustida namoz o‘qish ilk islom davrida keng tarqalmagan, balki yerda, bo‘yrada ham namoz o‘qilavergan. Hozirda Joynamoz keng ko‘lamda qo‘llanishidan qat’i nazar, zarurat taqozo qilgan paytlarda pok tuproq yoki o‘tloq ustida ibodat qilish mumkinligi nazarda tutilishi lozim. Joynamoz tayyorlash - musulmon mamlakatlarda amaliy san’atning an’anaviy yo‘nalishlaridan biri hisoblanadi. Joynamozdan asosiy maqsad namoz o‘qiladigan joy pokiza bo‘lishini ta’minlashdan iborat.

Joynamoz ustida namoz oʻqish ilk islom davrida keng tarqalmagan, yerda, boʻyrada ham oʻqilavergan. Joynamoz boʻlmagan taqdirda turli pokiza buyumlar (chopon, roʻmol, sholcha, qiyiq, mato va b.)dan joynamoz sifatida foydalanish mumkin. Hozirda joynamoz keng koʻlamda qoʻllanilishidan qatʼi nazar, zarurat taqozo qilgan paytlarda pok tuproq yoki oʻtloq ustida ibodat qilish mumkinligi nazarda tutilishi lozim. Joynamoz atamasi Qurʼonda tilga olinmagan.

Joynamoz tayyorlash musulmon mamlakatlarida amaliy sanʼatning anʼanaviy yoʻnalishlaridan biri hisoblanadi. Joynamoz matodan toʻrtburchak shaklida tayyorlanadi, kashtalar tikib bezatiladi. Kashta mujassamoti mehrob shaklida hoshiyalangan islimiy naqshlardan iborat. Matodan bezaksiz tayyorlangan joynamozning bosh tomoniga ramziy mehrob shakli tikiladi, namoz oʻqish paytida bu shakl Makka (qibla) tomonga qaratiladi. Hozirgi paytda turli hajmda gilam joynamozlar ham tayyorlanmoqda.""",
    """Nike Air Max is a line of shoes produced by Nike, Inc., with the first model released in 1987. Air Max shoes are identified by their midsoles incorporating flexible urethane pouches filled with pressurized gas, visible from the exterior of the shoe and intended to provide cushioning underfoot. Air Max was conceptualized by Tinker Hatfield, who initially worked for Nike designing stores."""
  ];

  static List<String> rasimlar = [
    "assets/images/0.jpg",
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
    "assets/images/5.jpg",
    "assets/images/6.jpg",
  ];
  static List<String> marketrasim = [
    "assets/images/k1.jpg",
    "assets/images/k2.jpg",
    "assets/images/k3.jpg",
    "assets/images/k4.jpg",
    "assets/images/k5.jpg",
    "assets/images/k6.jpg",
  ];

  static List<String> marketmal = [
    "Poyabzallar",
    "Ko`ylaklar",
    "Sovutgichlar",
    "Televizorlar",
    "Telefonlar",
    "Mashinalar",
  ];

  static List<String> malumotol = [
    "Central Doners",
    "Ays-Ti Padarka",
    "Sovvuq shorva",
    "Saladlar",
    "Muzqaymoqlar",
    "Yangi Muassasalar",
    "Coca Cola",
  ];
  static List<String> Gostlarol = [
    "Turk Oshxonasidan Ovqat zakaz qiling",
    "Har-Bir Zakaz uchun Ays-ti ga Ega bo`ling",
    "Sovuq Shorvalar",
    "",
    "Muzqaymoqlar",
    "Yangi Muassasalar",
    "Coca Cola",
  ];
  static List<String> marketA = [
    "New",
    "Products",
    "Beauty",
    "For Children",
    "Home and Gar..",
    "Electronics",
    "Furniture",
    "For Repair",
    "Sports",
    "Clothing",
    "Accessories",
    "Auto Goods",
    "Pet products",
    "Books",
  ];
  static List<Icon> marketAB = [
    Icon(Icons.new_releases_outlined),
    Icon(Icons.production_quantity_limits_sharp),
    Icon(Icons.beach_access),
    Icon(Icons.child_friendly_outlined),
    Icon(Icons.home_outlined),
    Icon(Icons.electric_bike_rounded),
    Icon(Icons.pregnant_woman),
    Icon(Icons.car_repair_outlined),
    Icon(Icons.sports),
    Icon(Icons.person_outlined),
    Icon(Icons.phone_android_outlined),
    Icon(Icons.fmd_good_sharp),
    Icon(Icons.palette_rounded),
    Icon(Icons.menu_book_sharp),
  ];
  static List<String> ikki = [
    "Asian",
    "Fast Food",
    "Drinks",
    "Coffeehouse",
    "Pizzeria",
    "For healthy",
    "European",
    "Pastry Shop",
    "Barbecue",
    "Ice cream",
    "Products",
    "New",
    "National",
    "Vegan",
  ];
  static List asiaNomi = [
    ["Osh", "Somsa", "Sumalak", "Norin", "Shorva"],
    ["Lavash", "Free", "Hot-Dog", "Donar", "Gamburger"],
    ["Coca-Cola", "Fanta", "Pepsi","Ace tea"],
    ["Espresson","Iced Coffee","Cappuccino","Macchiato","Americano","Latte"],
    ["Capricosa","Romana","Montenegrina","Capo","Tono"],
    ["Fish Fry", "Meat soup","Fresh milk","Sauce","Cake"],
    ["Ham & Eggs","Sausage & Eggs","My Burrito","Chile Verde"],
    ["Cup Cake","Cake","Cookie","Cherry Pastry"],
    ["Sandwiches","Plates","Kids Meal","Side Dishes","Beverages"],
    ["Toffee", "Dolce Freddo"],
    ["Cheeseburger","Fish Filet","Tuna Salad","Greek","Shef"],
    ["Grilled","Pasta","Cheeseburger"],
    ["Burgers","Dessert","Sandwiches","Salad","Appetizer"],
    ["English Muflin", "Vegan Salad","Vegan Cockies"],
  ];
  static List asiasoni = [
    [12000, 5000, 9000, 22000, 15000],
    [23000, 11000, 9000, 19000, 9000],
    [5000, 6000, 9000,3000],
    [8000,6000,7000,3000,5000,8000],
    [65000,35000,50000,55000,75000],
    [14000, 12000,18000,15000,8000],
    [9000,19000,8000,12000],
    [15000,19000,10000,12000],
    [14000,19000,23000,14000,22000],
    [25000, 15000],
    [25000,15000,18000,36000,55000],
    [35000,42000,22000],
    [28000,30000,33000,8000,9000],
    [25000,26000,19000],
  ];
  static List<String> uch = [
    "Energetik Adrenalin Rash",
    "Murobbo 'Malinali'",
    "Bahroma Muzqaymoq Shokolatli",
    "Bahroma Muzqaymoq Qulpnayli",
    "Fanta Salqin Ichimlik",
  ];
  static List<int> tort = [
    13000,
    23500,
    12900,
    9200,
    5000,
  ];
  static List<String> rasmi = [
    "assets/images/11.jpg",
    "assets/images/22.jpg",
    "assets/images/33.jpg",
    "assets/images/a.jpg",
    "assets/images/55.jpg",
  ];

  static List<String> rasimcha = [
    "assets/images/pnglar/shorva-removebg-preview.png",
    "assets/images/pnglar/burger-removebg-preview.png",
    "assets/images/pnglar/cola-removebg-preview.png",
    "assets/images/pnglar/coffee-removebg-preview.png",
    "assets/images/555.png",
    "assets/images/pnglar/kokat-removebg-preview.png",
    "assets/images/pnglar/barg-removebg-preview.png",
    "assets/images/pnglar/pirok-removebg-preview.png",
    "assets/images/pnglar/kabob-removebg-preview (1).png",
    "assets/images/pnglar/musqaymoq-removebg-preview.png",
    "assets/images/pnglar/sumka-removebg-preview.png",
    "assets/images/pnglar/New-removebg-preview.png",
  ];
  static List<String> fodRasim = [
    "assets/images/fod1.jpg",
    "assets/images/fod2.jpg",
    "assets/images/fod3.jpg",
    "assets/images/fod4.jpg",
    "assets/images/fod5.jpg",
    "assets/images/fod6.jpg",
    "assets/images/fod7.jpg",
    "assets/images/fod8.jpg",
    "assets/images/fod9.jpg",
    "assets/images/fod10.jpg",
    "assets/images/fod11.jpg",
    "assets/images/fod12.jpg",
    "assets/images/fod13.jpg"
  ];

  static List<String> phonesaim = [
    "assets/images/b1.jpg",
    "assets/images/b2.jpg",
    "assets/images/b3.jpg",
    "assets/images/b4.jpg",
    "assets/images/b5.jpg",
    "assets/images/b6.jpg",
  ];
  static List<String> phonemal = [
    "Iphone 12 pro MAX oq va qora",
    "MacBook pro (2020) kulrang 1 TB xotira",
    "Aston Martin Cars 258mg Qizil",
    "Joynamoz va Quron kitob komplekt",
    "Nike Air Max Orginal",
    "Palm Angels Orginal",
  ];

  static List<String> phonemalA = [
    "Iphone 12",
    "Mac Book pro",
    "Aston Martin",
    "Joynamoz va Quron",
    "Nike",
    "Palm Angels",
  ];
  static List<int> phonenarx = [
    1300,
    2500,
    10000,
    30,
    39,
    28,
  ];

  static List<String> marrasim = [
    "assets/images/c1.jpg",
    "assets/images/b6.jpg",
    "assets/images/b5.jpg",
    "assets/images/b1.jpg",
    "assets/images/k4.jpg",
    "assets/images/b2.jpg",
    "assets/images/b3.jpg",
    "assets/images/k6.jpg",
    "assets/images/k3.jpg",
    "assets/images/v1.jpg",
  ];

  static List<String> marricon= [
    "assets/images/zara.png",
    "assets/images/palm.jpg",
    "assets/images/nike.jpg",
    "assets/images/ipho.png",
    "assets/images/samsu.jpg",
    "assets/images/mac.jpg",
    "assets/images/asto.png",
    "assets/images/lom.png",
    "assets/images/shivi.jpg",
    "assets/images/zara.png",
  ];
  static List<String> marrnom= [
    "Zara",
    "Palm Angels",
    "Nike",
    "Iphone 12 pro Max",
    "Samsung",
    "MacBook pro",
    "Aston Martin",
    "Lamborghini",
    "Shivaki",
    "Zara",
  ];
  static List<String> marrnoma= [
    "New - Clothing - Accessories",
    "Clothing",
    "Shoes",
    "New - Phones",
    "New - Television",
    "New - Macbook",
    "Aston Martin",
    "Lamborghini",
    "New - Shivaki",
    "New - Clothing",
  ];

  static List Cockies = [
    ["assets/images/osh.jpg", "assets/images/somsa.jpg", "assets/images/sumalak.jpeg", "assets/images/norin.jpg", "assets/images/shorva.jpg"],
    ["assets/images/lavash.jpeg",  "assets/images/free.jpg","assets/images/hotdog.jpeg", "assets/images/donar.jpg", "assets/images/gamburger.jpg"],
    ["assets/images/cocacola.jpg", "assets/images/fanta.jpeg","assets/images/pepsi.jpg", "assets/images/acetea.jpg"],
    ["assets/images/espresson.jpg","assets/images/icedcoffee.jpeg","assets/images/cappuccino.jpg","assets/images/macchiato.jpg","assets/images/americano.jpeg", "assets/images/latte.jpg"],
    ["assets/images/capricosa.jpg","assets/images/romana.jpg","assets/images/capo.jpg","assets/images/tono.jpeg", "assets/images/capricosa.jpg"],
    ["assets/images/fishfry.JPG", "assets/images/meatsoup.jpg","assets/images/freshmilk.jpeg", "assets/images/souce.png", "assets/images/cake.jpg"],
    ["assets/images/ham&Eggs.jpg","assets/images/sausage&Eggs.jpg","assets/images/cheeseOmelet.jpg","assets/images/burrito.jpg",],
    ["assets/images/cupCake.jpg","assets/images/cake.jpg","assets/images/donuts.jpg","assets/images/cookie.jpeg"],
    ["assets/images/sandwiches.jpg","assets/images/plates.jpg","assets/images/kidsMeal.jpg","assets/images/sideDishes.jpg","assets/images/beverages.jpg"],
    ["assets/images/strawberry.jpg","assets/images/toffee.jpeg"],
    ["assets/images/cheeseburger.jpg","assets/images/fishFilet.jpg","assets/images/tunaSalad.jpg","assets/images/greek.jpg","assets/images/shef.jpg"],
    ["assets/images/grilled.jpg","assets/images/pasta.jpg","assets/images/cheeseburger.jpg"],
    ["assets/images/cheeseburger.jpg","assets/images/tunaSalad.jpg","assets/images/sandwiches.jpg","assets/images/veganSalad.jpg","assets/images/appetizer.jpg"],
    ["assets/images/englishMuflin.jpg","assets/images/veganSalad.jpg","assets/images/veganCockies.jpg"],
  ];
  static List Cockieslar = [
    ["Dress", "Shirt", "Suit", "Sweater"],
    ["Outerwear", "Ladieswear", "Underwear", "Sportswear"],
    ["Suit", "Trousers", "Skirt", "Raincoat"],
    ["Sneakers", "Hat", "Jeans", "Shorts"],
    ["Carpet", "Curtain", "Blinds", "Sofa"],
    ["Headphones", "Television", "Telephone", "Computer"],
    ["Sofa", "Chair", "Bed", "Table"],
    ["Hacksaw", "Roller", "Crowbar", "Trowel"],
    ["Uniform", "Guard", "Glove", "Cleats"],
    ["Socks", "Vest",],
    ["Sunglasses", "Apron", "Necklace", "Watch"],
    ["Tires", "Seat", "Steering"],
  ];
  static List Narxlar = [
    [70, 3, 23, 7],
    [324, 895, 58, 1300],
    [23, 15, 4, 320],
    [30, 2, 60, 9],
    [100, 30, 500, 230],
    [130, 400, 1200, 1350],
    [230, 40, 170, 28],
    [20, 10, 2, 3],
    [18, 60, 30, 10],
    [2, 10, 3, 43],
    [14, 17, 2, 150],
    [20, 320, 700, 20],
    [2, 1, 5, 1],
    [3, 1, 2, 1]
  ];
  static List Cockiesrasim = [
    ["assets/images/dress.jpg", "assets/images/Shirt1.jpg", "assets/images/Suit.jpg","assets/images/Sveater.jpg"],
    ["assets/images/Outerwear.jpg", "assets/images/Ladieswear.jpg", "assets/images/unde.jpg", "assets/images/sor.png"],
    ["assets/images/womewns.jpg", "assets/images/Trousers.jpg","assets/images/Skirt.jpg","assets/images/Raincoat.jpg"],
    ["assets/images/childsne.jpg","assets/images/childremhet.jpg","assets/images/childejins.jpg","assets/images/childshot.jpg"],
    ["assets/images/Carpet.jpg","assets/images/Curtain.jpd.jpg","assets/images/Blinds.jpg","assets/images/Sofa.jpg"],
    ["assets/images/Headphones.jpg", "assets/images/Television.jpeg","assets/images/Telephone.jpg","assets/images/Computer.jpg"],
    ["assets/images/Sofa.jpg","assets/images/Chair.jpg","assets/images/Bed.jpg","assets/images/Table.jpg"],
    ["assets/images/Hacksaw.jpg","assets/images/Roller.jpeg","assets/images/Crowbar.jpg","assets/images/Trowel.jpg"],
    ["assets/images/Uniform.jpg","assets/images/Guard.jpg","assets/images/Glove.jpg","assets/images/Cleats.jpg"],
    ["assets/images/Socks.jpg","assets/images/Vest.jpg"],
    ["assets/images/Sunglasses.jpg","assets/images/Apron.jpg","assets/images/Necklace.jpg","assets/images/Watch.jpg"],
    ["assets/images/Tires.jpg","assets/images/Seat.jpg","assets/images/Steering.jpg"],
  ];
  static List Adrenalin= [
    """Energetik ichimliklar ( so'zlashuv energetikasi , energotonika ) - bu insonning markaziy asab tizimini rag'batlantirish qobiliyatini va / yoki sedativga qarshi ta'sirini ta'kidlaydigan ichimliklar.

Ba'zi ichimliklar tarkibi 

Ichimlik qutisining odatdagi hajmi 0,25-0,449 litr, kamdan-kam 1 litr. Ko'pgina ichimliklar tarkibida uglevodlar , taurin , kofein , guarana , niatsin (B 3 ), pantotenik kislota (B 5 ), piridoksin (B 6 ), foliy kislotasi (B 9 ), askorbin kislota (C) mavjud.

Ichimlikning ta'siri 

Energiya ichimliklar qutisi haqida sog'liq to'g'risida ogohlantirish: “Kuniga ikkitadan ko'p ichish sog'lig'ingizga zarar etkazishi mumkin. Homilador ayollar, chaqaloqlar, 16 yoshgacha bo'lgan bolalar, yurak xastaligi, qon bosimi, diabet yoki kofein allergiyasiga chalinganlarga tavsiya etilmaydi. ”
Kofein mazmuni energiya ichimliklar navlar shu hajmi nisbatan bir oz pastroq qahva . Ko'pincha kofein miqdori 100 ml mahsulot uchun 30 mg ni tashkil qiladi. Energiya ichimliklarining kofein miqdori 218,6 mg / L dan 321 mg / L gacha, Kanadada Health tomonidan tavsiya etilgan yuqori chegara kuniga 400 mg.""",
    """Tarkib:
    
Malinali murabbo xususiyatlari

Tanaga malinali murabbo nima foydali

Malinali murabbo emizikli onaga berilishi mumkinmi?

Homilador ayollarda malina murabbo bo'lishi mumkinmi?

Malinali murabbo bosimni oshiradi yoki pasaytiradi

Malinali murabbo foydalanish

Malinadan murabbo qancha yeyishim mumkin

Malinali murabbo - har bir kishi uchun an'anaviy va sevimli shirin, har yili qish uchun yig'ib olinadi. Ushbu mahsulot qo'shilgan iliq choyning sovuq tomoqni davolashga yordam berishi haqiqatan ham bolalarga ma'lum. Ammo, aslida, malina murabbo foydasi ko'proq. Ushbu reza vitaminlar va davolovchi moddalarning haqiqiy "xazinasi" dir, qo'shimcha ravishda u qisqa qaynatilgandan keyin ham ijobiy xususiyatlarining ko'pini saqlab qoladi.

Shuni esda tutish kerakki, odam bu shirinlikka o'ylamasdan kira olmaydi; mutanosiblik hissini unutmasdan, uni ehtiyotkorlik bilan ishlatish kerak. Bu, ayniqsa, homilador yoki emizikli onaga tegishli bo'lganda juda muhimdir. Shuni ham yodda tutish kerakki, allergiya bilan kasallanganlar yoki ba'zi bir surunkali sog'liq muammolari bo'lgan odamlar, shuningdek, 3 yoshgacha bo'lgan bolalar ushbu shirinlikni ishlatmasliklari kerak.""",
    """Ikki hissa ko’proq shokoladdagi turshakli muzqaymog’i 

Tarkibi: sutli shokolad (shakar, kakao yog’i, qirilgan kakao, sut yog’lari, quruq sut, soya letsitini, glyukoza-mevali sirop, mevali to’ldiruvchi qo’shimcha (shakar, suv, o’rikli pyure, glyukoza-mevali sirop, quyltirgich: pektin, makkajo’xori kraxmali, kislota rostlatgichi, limon kislotasi, O’rik xushbo’lyagichi, tabiiy beta-karotin bo’yoqlari),sigir suti, shokoladli glazur (kakos yog’i, shakar, kakao kukuni, soya letsitini, vanilin), mevali asos (maydalangan turshak, shakar, makkajo’xori kraxmali, kislota rostlatgichi, turshak xushbo’ylagichi, tabiiy beta-karotin bo’yog’i), shakar, quyultirilgan sut, glyukoza siropi, quruq sut, sariyog’, stablizator (qo’zoqli seratoniya qatroni, guar qatroni, karraginan), emulgator.

Sutli qismida yog’lar 10% ni tashkil qiladi, oqsillar 3 gr ni, yog’lar 20,4 gr ni, uglevodlar 40,6 gr ni tashkil qiladi.

Enetgerik quvvati 360 kKalni tashkil qiladi.""",
    """Anor-gilos mevali luqum muzqaymoqlari

Tarkibi: Tarkibi: sigir suti, mevali muz (suv, shakar, gilos, anor va olcha qaylasi(suv, shakar, limon sharbatlari aralashmasi, quyuqlashtiruvchi, makkajo’xori kraxmali, tabiiy oziq-ovqat bo’yog’i beta-karotin) maltdekstrin, stablizatorlar: qo’zoqli seratoniya qatroni, guar qatroni, karraginan, kislota rostlatgichi, limon kislotasi), shakar, quyultirilgan sut, glyukoza siropi, quruq sut, sariyog’, emulgator va Vanilin xushbo’ylantiruvchisi.

Sutli qismida yog’lar 5% ni tashkil qiladi, oqsillar 2,3 gr ni, yog’lar 2,8 gr ni, uglevodlar 27,1 gr ni tashkil qiladi.

Enetgerik quvvati 140 kKalni tashkil qiladi.

Ishlab chiqarilgan mamlakat: Qozog’iston""",
    """Fanta (nemicha: Fanta) — Coca-Cola kompaniyasiga tegishli gazlangan, spirtsiz ichimliklarning markasi. Dunyo yuzida 90ga yaqin turli ichimliklarni ishlab chiqaradi. Fantani dunyadagi 160 davlatlardan sotib olsa boʻladi.
    
    Ichimlik 1940-yili Ikkinchi jahon urushi yillarida yaratilgan. [1] Urush tufayli Germaniya Coca-Cola ichimligini ishlab chiqarish uchun kerakli qiyom (ruscha: сироп) yetkazilishi toʻxtatiladi. Shunda Maks Keyt yangi mahsulot ishlab chiqarishga qaror qildi. Tarkibida asosan olma kunkarasi boʻldi. Paydo boʻlgan ichimlik sariq tusni oldi va hozirgi kundagi keng tarqalgan apelsinli „Fanta“ning taʼm idan qattiq farq qilgan [2]. 2008-yili olmali Fanta yana qaytib sotuvga chiqdi.""",
  ];
  static List<List<String>> RasmlarListi = [
  [
  "https://ae01.alicdn.com/kf/H62c0facf609749c2b4ed380d9031d828w/Original-Designer-95-Cushion-Men-Women-Sneaker-Luxury-Shoes-95c-Running-Shoes-Knit-Mesh-Fly-3.jpg",
  "https://cdn.shopify.com/s/files/1/1675/8179/products/10230_0_0x2_aa696c12-072a-4e11-8fb8-4c3fd3365d4f_2000x.jpg?v=1561886044",
  "http://feriola.com/wp-content/uploads/2019/03/1-29.jpg",
  "https://ng.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/61/203743/1.jpg?6549",
  "https://ph-live-01.slatic.net/p/5ab1ce445a27baa6885edfb66591f54f.jpg",
  "https://http2.mlstatic.com/D_NQ_NP_639879-MLM43819755659_102020-O.jpg",
  "https://ae01.alicdn.com/kf/HTB1_AwYXdfvK1RjSspfq6zzXFXap/Male-Breathable-Comfortable-Casual-Shoes-Fashion-Men-Canvas-Shoes-Lace-up-Wear-resistant-Men-Sneakers-zapatillas.jpg_q50.jpg",
  "https://res.cloudinary.com/webstore/image/fetch/w_450,c_limit,c_fit,f_auto,e_trim/https%3A%2F%2Fae01.alicdn.com%2Fkf%2FH754c653b32c944d09cd21875c482fb91T%2FWomen-Shoes-Chunky-Sneakers-Vulcanize-Shoes-Fashion-New-Female-White-Platform-Sport-Dad-Shoes-Zapato-Tenis.jpg",
  "https://res.cloudinary.com/webstore/image/fetch/w_450,c_limit,c_fit,f_auto,e_trim/https%3A%2F%2Fae01.alicdn.com%2Fkf%2FHTB18ZRQXtjvK1RjSspiq6AEqXXaP%2FWomen-s-Chunky-Sneakers-2021-Fashion-Women-Platform-Shoes-Lace-Up-Pink-Vulcanize-Shoes-Womens-Female.jpg",
  "https://image.made-in-china.com/202f0j00BpRfzcLgOPqN/Hot-Sale-Low-Top-Stylish-Men-Sneakers-Brand-China-Air-Mesh-Sneaker-Design-Wholesale-OEM-Shoes-Air-Cushion-Sneakers.jpg",
  ],
  [
  "https://i.pinimg.com/736x/28/88/47/2888474a68830e2929df761989428349.jpg",
  "https://i.pinimg.com/originals/83/96/c1/8396c135f0e3105995f241116895417d.jpg",
  "https://i.pinimg.com/originals/d2/2a/bd/d22abdde55ecb68b778c0cf887219ceb.jpg",
  "https://i.pinimg.com/736x/f4/3f/20/f43f207f61e6efad526d97adb1cc1f95.jpg",
  "https://i.pinimg.com/originals/c0/28/fc/c028fce72c79c99e5a716b89637a445a.jpg",
  "https://i.pinimg.com/originals/5a/7b/7b/5a7b7be5216b6719d56e0be3471e7772.jpg",
  "http://cdn.shopify.com/s/files/1/1878/8365/files/maxi_skirt_-_hijab_stylere.jpg?v=1559044205",
  "https://ae01.alicdn.com/kf/U5086a9e9e7ac4718842fd13d809482b3l/Women-Dress-New-Season-Autumn-Winter-2-Piece-Hijab-Knitwear-Suit-Islamic-Muslim-Clothing-Long-Cardigan.jpg",
  "https://cdn.shopify.com/s/files/1/0325/4760/2491/products/IMG-20210508-WA0550_large.jpg?v=1620501270",
  "https://cdn.shopify.com/s/files/1/1105/1322/products/Royal_Blue_Gold_Designer_Embroidered_Silk_Anarkali_Gown_-_Saira_s_Boutique.png?v=1548914811",
  ],
  [
  "https://www.cnet.com/a/img/pqUnVk5oHa0zykxOwEp_TGpqBqM=/940x0/2019/07/11/ef17ab6c-af19-4cf6-840e-5cf94721c558/keystone-m-series-14000-btu-portable-air-conditioner.jpg",
  "https://static.tildacdn.com/tild3036-6563-4566-b339-323738333663/7.jpg",
  "https://i.ytimg.com/vi/h9TOstxu9kE/maxresdefault.jpg",
  "https://kondicionerykazan.ru/wp-content/uploads/2020/05/8.jpg",
  "https://media2.24aul.ru/imgs/5d1debc050b12400012714c5/brizer-tion-ventilyatsiya-v-kvartiru-tion-o2-next---3-12711955.jpg",
  "https://cdn.vox-cdn.com/thumbor/gRRx95v-5BX9SC8eRgopY5oiEKg=/0x0:5872x4683/1200x800/filters:focal(2467x1873:3405x2811)/cdn.vox-cdn.com/uploads/chorus_image/image/54694673/GettyImages_85903703.0.jpg",
  "https://contentgrid.thdstatic.com/hdus/en_US/DTCCOMNEW/Articles/types-of-air-conditioners-section-1.jpg",
  "https://i.pinimg.com/originals/12/1c/81/121c81cffb5606941a92afaf92408159.jpg",
  "https://static.appliancesconnection.com/product/450x420/64339e616cebb3944295d35ff78e592b_3056607.jpg",
  "https://img.joomcdn.net/9a099328dfe15a8c5da7b7473ae0b0332f2ef922_original.jpeg"
  ],
  [
  "https://icdn.digitaltrends.com/image/digitaltrends/netflix-streaming-3-720x720.jpg",
  "https://compote.slate.com/images/b1b0e74c-8d38-48f2-b02f-77f207a27c57.gif?width=840&rect=1200x800&offset=0x0",
  "https://www.pymnts.com/wp-content/uploads/2017/12/shutterstock_227118130.jpg",
  "https://gridfiti.com/wp-content/uploads/2021/03/Gridfiti_Blog_GamingEntCenter_Inspo_AllBlack-2.jpg",
  "https://gridfiti.com/wp-content/uploads/2021/03/Gridfiti_Blog_GamingEntCenter_0_Header.jpg",
  "https://officechairist.com/wp-content/uploads/2019/09/Huge-Screen.jpg",
  "https://abload.de/img/m3ffrh5sji5k.jpg",
  "https://gridfiti.com/wp-content/uploads/2021/03/Gridfiti_Blog_GamingEntCenter_Inspo_Hybrid.jpg",
  "https://i.redd.it/embxz2sxmcc11.jpg",
  "https://cdn.shopify.com/s/files/1/0003/7719/2499/products/5_5ae1dae7-8b6e-4ed9-8537-a32ab07c1b92_963x.progressive.jpg?v=1612502593"
  ],
  [
  "https://www.igyaan.in/wp-content/uploads/2018/10/Samsung-Galaxy-A9-Pics-2-1100x733.jpg",
  "https://images.samsung.com/levant/smartphones/galaxy-s20/images/galaxy-s20_banner_goto_fan-edition_s.jpg",
  "https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2020/10/galaxy-s20-fe-1602852288.jpg",
  "https://i.ytimg.com/vi/-r64R07IfvY/maxresdefault.jpg",
  "https://lh3.googleusercontent.com/proxy/Nvz5po_jK0Og0VyKwhwKnp3CJEYOrIfvQ-l0D6P9ngZqYXZjNPX3QNumwJuAv6cgOMHO4mVykn-fZN-LP4IjECwghP1QuHT10CnJW0hPz5g_qkxCE34h6_GP35sV",
  "https://images.hothardware.com/contentimages/article/3005/content/small_galaxy-note-20-ultra-style-2.jpg",
  "https://play-lh.googleusercontent.com/9gXdHsWDzFes-9dwHcH_G5bJjcya9sAo_cG8PxsqzB1ZmyJaoccG7xSFT_rkOy6TabY",
  "https://media.techeblog.com/images/samsung-galaxy-note-21-ultra-5g-leak.jpg",
  "https://images.idgesg.net/images/article/2021/01/galaxy-s21-camera-100873530-large.jpg",
  "https://www.nillkinmall.com/media/wysiwyg/SAMSUNG/Samsung_S21Ultra/NILLKIN_Business_Style_Aoge_Leather_Case_For_Samsung_Galaxy_S21_Ultra_7.jpg"
  ],
  [
  "https://www.salonprivemag.com/wp-content/uploads/2020/12/bug.jpg",
  "https://s1.cdn.autoevolution.com/images/news/gallery/dubai-police-supercars-explained-the-full-story_1.jpg",
  "https://cdn.thisiswhyimbroke.com/images/bugatti-divo-hypercar1-640x533.jpg",
  "https://www.carscoops.com/wp-content/uploads/2021/06/2022-Chevrolet-Camaro.jpg",
  "https://cdn.motor1.com/images/mgl/7MKG6/s1/mid-engined-chevrolet-camaro-rendering.jpg",
  "https://www.carscoops.com/wp-content/uploads/2020/12/lamborghini-sc20-squadra-corse-25.jpeg",
  "https://i2.wp.com/www.musclecarsandtrucks.com/wp-content/uploads/2020/07/2021-Dodge-Durango-Hellcat-SRT-Up-Close-scaled.jpg?resize=758%2C505&ssl=1",
  "https://cdnb.artstation.com/p/assets/images/images/002/446/335/large/pavel-grebenyukov-f-4b28e0cd6fb0b.jpg?1461831567",
  "https://img.etimg.com/thumb/msid-80581286,width-640,resizemode-4,imgsize-141316/hyper-sports-car.jpg",
  "https://i.mycdn.me/i?r=AyH4iRPQ2q0otWIFepML2LxRAdhHDE_07dETs3mTy8bWbg"
  ]
];
}

import 'package:express24/bottomlar/market.dart';
import 'package:express24/bottomlar/shopPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Najot{
  String i;
  String n;
  int ss;
  Najot(this.i,this.n, this.ss);

}
class SearchPage extends StatefulWidget {
  const SearchPage(PageStorageKey<String> keySearch, {Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var _controller = TextEditingController();
  List<Widget> searching = [];
  int cc = 1;
  @override
  Widget build(BuildContext context) {
    Widget yasama1(String name, var price, String image, int soni, int cc){
      return GestureDetector(
        child: Card(
          child: ListTile(
            leading: Container(
              height: 50.0,
                width: 50.0,
                child: Image.asset(image,fit: BoxFit.cover,)),
            title: Text(name),
            trailing: Text(price.toString()+ "${cc == 1 ? " so`m" : " \$"}"),
            subtitle: Text(soni.toString()),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        onTap: (){},
      );
    }
    Widget yasama(String name, int price, String image, int cc, int x){
      return GestureDetector(
        child: Card(
          child: ListTile(
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.black26),
                image: DecorationImage(
                  image: AssetImage(image),fit: BoxFit.cover
                )
              ),
              height: 50.0,
                width: 50.0,),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(name.length, (index) {
                  if(x < index+1){
                    return Text(name[index]);
                  }else{
                    return Text(name[index],style: TextStyle(color: Colors.red),);
                  }
                })
            ),
            trailing: Text(price.toString() + "${cc == 1 ? " so`m" : " \$"}"),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            int son=0;
            var x = Najot(image, name, price);
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
                                        image: AssetImage(image),
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
                                    child: Text("Narxi: ${price} ${cc == 1 ? " so`m" : " \$"}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),),
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
                                  child: Text(name,style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),),
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
                                child: Text("Salom",style: TextStyle(fontSize: 16.0),),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              width: 220.0,
                              height: 60.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(onPressed: (){
                                    setState(() {
                                      if(son > 0){
                                        son -= 1;
                                      }
                                    });
                                  }, child: Icon(Icons.exposure_minus_1_rounded,color: Colors.red,)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                                    child: Container(
                                        alignment: Alignment.center,
                                        width: 60.0,
                                        height: 50.0,
                                        child: Text("${son}", style: TextStyle(fontSize: 30.0,color: Colors.red, ),)),
                                  ),
                                  TextButton(
                                      onPressed: (){
                                    setState(() {
                                      print("Salom $son");
                                      son += 1;
                                    });
                                  },
                                      child: Icon(Icons.exposure_plus_1_sharp, color: Colors.green,)),
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
                          var b = 0;
                          if(son > 0){
                            for (int i = 0; i < Malumotlar.asiaNomi.length; i++){
                              for (int j = 0; j < Malumotlar.asiaNomi[i].length; j++){
                                if(x.n == Malumotlar.asiaNomi[i][j]){
                                  b = 1;
                                  break;
                                }
                              }
                            }
                            for (int i = 0; i < Malumotlar.Cockieslar.length; i++){
                              for (int j = 0; j < Malumotlar.Cockieslar[i].length; j++){
                                if(x.n == Malumotlar.Cockieslar[i][j]){
                                  b = 2;
                                  break;
                                }
                              }
                            }
                            if (b == 1) {
                              myprise.add(son * x.ss);
                              restaurant.add(yasama1(x.n, x.ss, x.i, son, cc));
                            }
                            else if(b == 2){
                              myprisela.add(son * x.ss);
                              market.add(yasama1(x.n, x.ss, x.i, son, cc));
                            }
                            son = 0;
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            );
          }));
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.yellow,
        title: Center(
            child: Text("Search", style: TextStyle(color: Colors.grey[500]),)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              keyboardType: TextInputType.text,
              maxLength: 30,
              style: TextStyle(fontSize: 18.0, color: Colors.black),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey, size: 28.0,),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _controller.clear();
                      setState(() {
                        searching = [];
                        for (int i = 0; i < Malumotlar.asiaNomi.length; i++) {
                          for (int j = 0; j < Malumotlar.asiaNomi[i].length; j++) {
                            searching.add(yasama(Malumotlar.asiaNomi[i][j], Malumotlar.asiasoni[i][j], Malumotlar.Cockies[i][j], cc, 0));
                          }
                        }
                        for (int i = 0; i < Malumotlar.Cockieslar.length; i++) {
                          for (int j = 0; j < Malumotlar.Cockieslar[i].length; j++) {
                            searching.add(yasama(Malumotlar.Cockieslar[i][j], Malumotlar.Narxlar[i][j], Malumotlar.Cockiesrasim[i][j], cc, 0));
                          }
                        }
                      });
                    },
                    icon: Icon(Icons.clear),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: Colors.black26
                    )
                  )
              ),
              onTap: (){
                setState(() {
                  for (int i = 0; i < Malumotlar.asiaNomi.length; i++) {
                    for (int j = 0; j < Malumotlar.asiaNomi[i].length; j++) {
                      searching.add(yasama(Malumotlar.asiaNomi[i][j], Malumotlar.asiasoni[i][j], Malumotlar.Cockies[i][j], cc, 0));
                    }
                  }
                  for (int i = 0; i < Malumotlar.Cockieslar.length; i++) {
                    for (int j = 0; j < Malumotlar.Cockieslar[i].length; j++) {
                      searching.add(yasama(Malumotlar.Cockieslar[i][j], Malumotlar.Narxlar[i][j], Malumotlar.Cockiesrasim[i][j], cc, 0));
                    }
                  }
                });
              },
              onChanged: (e) {
                //print(e[0]);
                setState(() {
                  if(e.length==0){
                    searching = [];
                    for (int i = 0; i < Malumotlar.asiaNomi.length; i++) {
                      for (int j = 0; j < Malumotlar.asiaNomi[i].length; j++) {
                        searching.add(yasama(Malumotlar.asiaNomi[i][j], Malumotlar.asiasoni[i][j], Malumotlar.Cockies[i][j], cc, 0));
                      }
                    }
                    for (int i = 0; i < Malumotlar.Cockieslar.length; i++) {
                      for (int j = 0; j < Malumotlar.Cockieslar[i].length; j++) {
                        searching.add(yasama(Malumotlar.Cockieslar[i][j], Malumotlar.Narxlar[i][j], Malumotlar.Cockiesrasim[i][j], cc, 0));
                      }
                    }
                      }else{
                    cc = 1;
                    searching = [];
                    for (int i = 0; i < Malumotlar.asiaNomi.length; i++) {
                      for (int j = 0; j < Malumotlar.asiaNomi[i].length; j++) {
                        var s=Malumotlar.asiaNomi[i][j];
                        var t = s[0] == e[0].toUpperCase() || s[0] == e[0].toLowerCase();
                        if(e.length <= Malumotlar.asiaNomi[i][j].length){
                          if(t && e.length > 1){
                            for (int ka = 1; ka < e.length; ka++){
                              if(s[ka] == e[ka]){
                                t=true;
                              }
                              else{
                                t=false;
                              }
                            }
                            if(t ){
                              if(e.length <= Malumotlar.asiaNomi[i][j].length){
                                searching.add(yasama(s, Malumotlar.asiasoni[i][j], Malumotlar.Cockies[i][j],1,e.length));
                              }else{
                                searching = [];
                              }
                            }
                          }
                          else if(e.length == 1 && t){
                            if(e.length <= Malumotlar.asiaNomi[i][j].length){
                              searching.add(yasama(s, Malumotlar.asiasoni[i][j], Malumotlar.Cockies[i][j],1,e.length));
                            }else{
                              searching = [];
                            }
                          }
                        }
                      }
                    }

                    for (int i = 0; i < Malumotlar.Cockieslar.length; i++) {
                      for (int j = 0; j < Malumotlar.Cockieslar[i].length; j++) {
                        var s=Malumotlar.Cockieslar[i][j];
                        var t = s[0] == e[0].toUpperCase() || s[0] == e[0].toLowerCase();
                        if(e.length <= Malumotlar.Cockieslar[i][j].length){
                          if(t && e.length > 1){
                            for (int ka = 1; ka < e.length ; ka++){
                              if(s[ka] == e[ka]){
                                t=true;
                                cc=2;
                              }else{
                                t=false;
                              }
                            }

                            if(t ){
                              if(e.length <= Malumotlar.Cockieslar[i][j].length){
                                searching.add(yasama(s, Malumotlar.Narxlar[i][j], Malumotlar.Cockiesrasim[i][j],2, e.length));
                              }else{
                                searching = [];
                              }
                            }
                          }

                          else if(e.length == 1 && t){
                            if(e.length <= Malumotlar.Cockieslar[i][j].length){
                              searching.add(yasama(s, Malumotlar.Narxlar[i][j], Malumotlar.Cockiesrasim[i][j],2, e.length));
                            }else{
                              searching = [];
                            }
                          }
                        }
                      }
                    }
                  }
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView(
                children: searching,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

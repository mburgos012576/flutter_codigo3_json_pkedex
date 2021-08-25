import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List misPokemons = [];
  @override
  initState() {
    super.initState();
    getData();
  }

  getData() async {
    String path =
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
    Uri _uri = Uri.parse(path);
    http.Response res = await http.get(_uri);
    print(res.statusCode);
    //if(res.statusCode == 200){
    Map<String, dynamic> myMap = json.decode(res.body);
    misPokemons = myMap["pokemon"];
    //}
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Pokedex More",
          style: TextStyle(
              color: Color(0xff4b4b4b),
              fontSize: 30,
              fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu_open,
              color: Color(0xff4b4b4b),
              size: 30.0,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: GridView.builder(
            itemCount: misPokemons.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              print(index);
              return buildCard(misPokemons[index]["name"],
                  misPokemons[index]["type"], misPokemons[index]["img"]);
            }),
      ),
    );
  }

  Card buildCard(String name, List type, String url) {
    Map<String,dynamic> colours = {
      "Grass": 0xff47CEAE,
      "Poison":0xffFB6C6C,
      "Fire": 0xffFB6C6C,
      "Flying": 0xffFFD86F,
      "Water": 0xff6C79DB,
      "Bug":0xff73BAFC,
      "Normal":0xffFFD86F,
      "Ground":0xff73BAFC,
      "Electric":0xffFFD86F,
      "0xffFFD86F":0xffFB6C6C
    };

    return Card(
      elevation: 3.0,
      shadowColor: Colors.white54,
      color: Color(colours["${type[0]}"]).withOpacity(0.7),//Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(26.0),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 7.0, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color(colours["${type[0]}"]),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Text(
                          type[0],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 7.0, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color(colours["${type[0]}"]),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Text(
                          type[0],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Color(colours["${type[0]}"]),
                    child: Image.network(url),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

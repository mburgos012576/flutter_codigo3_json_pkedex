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
    Map<String, dynamic> myMap = json.decode(res.body);
    misPokemons = myMap["pokemon"];
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Pokedex",
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
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Card(
            elevation: 3.0,
            shadowColor: Colors.white54,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26.0),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Text("Bulbasaur", style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 7.0,vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xff43ee9d),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Text("Grass"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


}

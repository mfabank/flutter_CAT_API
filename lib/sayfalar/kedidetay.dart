import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapiexample/api/cats_api.dart';
import 'package:flutterapiexample/models/kediler.dart';

class KediDetay extends StatefulWidget {
  final String catID;
  final String catBreed;

  KediDetay({this.catID, this.catBreed});

  @override
  _KediDetayState createState() => _KediDetayState();
}

class _KediDetayState extends State<KediDetay> {
  CatList catList = CatList();
  void getCatData() async {
    var catJson = await CatAPI().getCatBreed(widget.catID);
    print(catJson);

    var catMap = json.decode(catJson);
    print(catMap);
    setState(() {
      catList = CatList.fromJson(catMap);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCatData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.catBreed),
      ),
      body: getCat(),
    );
  }

  Widget getCat() {
    var mediaSize = MediaQuery.of(context).size;

    if (catList == null ||
        catList.breeds == null ||
        catList.breeds.length == 0) {
      return Container();
    }
    return Center(
      child: Container(
          width: mediaSize.width,
          height: mediaSize.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(catList.breeds[0].url),
                fit: BoxFit.contain),
          )),
    );
  }
}

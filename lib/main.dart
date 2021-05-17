import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapiexample/api/cats_api.dart';
import 'package:flutterapiexample/models/kediler.dart';
import 'package:flutterapiexample/sayfalar/kedidetay.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    theme: ThemeData.dark(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BreedList breedList = BreedList();

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
        title: Text('Cats Breeds'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: (breedList == null ||
                breedList.breeds == null ||
                breedList.breeds.length == 0)
            ? 0
            : breedList.breeds.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    breedList.breeds[index].name,
                    style: TextStyle(color: Colors.red),
                  ),
                  subtitle: Text(breedList.breeds[index].description),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => KediDetay(
                            catID: breedList.breeds[index].id,
                            catBreed: breedList.breeds[index].name,
                          )));
            },
          );
        },
      ),
    );
  }

  void getCatData() async {
    var result = await CatAPI().getCatBreeds();
    print(result);

    var catMap = json.decode(result);
    setState(() {
      breedList = BreedList.fromJson(catMap);
    });
  }
}

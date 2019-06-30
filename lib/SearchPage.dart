import 'package:flutter/material.dart';
import 'dart:convert';

import 'API.dart' as API;
import 'Models/PlaceResponse.dart';
import 'Models/Place.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  List<Place> cities = [];

  getCities(String str) {
    API.getCities(str).then((response) {
      final responseJson = json.decode(response.body);
      final laceResponse = new PlaceResponse.fromJson(responseJson);
      setState(() {
        cities = laceResponse.data;
      });
    }).catchError((error) {
      print(error);
    }).whenComplete(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget divider = Divider(color: Colors.black12, height: 1.0, indent: 18,);

    return Scaffold(
        appBar: AppBar(
          title: Text('Search City'),
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.grey[100]),
              child: Padding(
                padding: EdgeInsets.only(left: 14.0, right: 14.0),
                child: Center(
                  child: TextField(
                    autofocus: true,
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        hintText: 'Please enter your city'),
                    onChanged: (str) {
                      getCities(str);
                    },
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView.separated(
              itemCount: cities.length,
              separatorBuilder: (BuildContext context, int index) {
                return divider;
              },
              itemBuilder: (context, index) => EntryItem(cities[index]),
            ))
          ],
        ));
  }
}

class EntryItem extends StatelessWidget {
  final Place place;

  const EntryItem(this.place);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: InkWell(
        onTap: (() {
          Navigator.of(context).pop(place.uid);
        }),
        child: ListTile(
          title: Text(place.station.name),
        ),
      ),
    );
  }
}

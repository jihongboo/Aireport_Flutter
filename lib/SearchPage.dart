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
  List<Place> citys = [];

  getCitys(String str) {
    API.getCities(str).then((response) {
      final responseJson = json.decode(response.body);
      final laceResponse = new PlaceResponse.fromJson(responseJson);
      setState(() {
        citys = laceResponse.data;
      });
    }).catchError((error) {
      print(error);
    }).whenComplete(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('搜索'),
          elevation: 0.0,
        ),
        body: Stack(
          alignment: const Alignment(0.0, -1.0),
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.grey[100]),
              child: Padding(
                padding: EdgeInsets.only(left: 18.0, right: 18.0),
//              color: Colors.red,
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
                    getCitys(str);
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40.0),
              child: ListView.builder(
                itemCount: citys.length,
                itemBuilder: (context, index) => EntryItem(citys[index]),
              ),
            )
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
    return InkWell(
      onTap: ((){
        Navigator.of(context).pop(place.uid);
      }),
      child: ListTile(
        title: Text(place.station.name),
      ),
    );
  }
}

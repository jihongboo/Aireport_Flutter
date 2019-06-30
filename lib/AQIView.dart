import 'package:flutter/material.dart';
import 'API.dart' as API;


class AQIView extends StatelessWidget {
  final int aqi;
  final String place;
  final VoidCallback tap;

  AQIView({this.aqi, this.place, this.tap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _getColor(aqi),
        body: Stack(
          alignment: const Alignment(0.0, 0.8),
          children: <Widget>[
            Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      place,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      aqi.toString(),
                      style: TextStyle(
                          fontSize: 100.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                )),
            IconButton(
              icon: Icon(Icons.location_on),
              onPressed: () {
                StatusBarColorNotification(Colors.white).dispatch(context);
                Future future = Navigator.of(context).pushNamed("/searchPage");
                future.then((value) {
                  API.setCityUid(value);
                  tap();
                });
              },
              iconSize: 50.0,
              color: Color.fromARGB(125, 255, 255, 255),
            )
          ],
        ));
  }

  Color _getColor(int aqi) {
    Color color = Color.fromARGB(255, 43, 153, 102);
    if (aqi > 300) {
      color = Color.fromARGB(255, 126, 2, 35);
    } else if (aqi > 201) {
      color = Color.fromARGB(255, 102, 0, 153);
    } else if (aqi > 150) {
      color = Color.fromARGB(255, 203, 5, 50);
    } else if (aqi > 100) {
      color = Color.fromARGB(255, 248, 153, 52);
    } else if (aqi > 50) {
      color = Color.fromARGB(255, 251, 222, 50);
    }
    return color;
  }
}

class StatusBarColorNotification extends Notification {
  StatusBarColorNotification(this.color);

  final Color color;
}

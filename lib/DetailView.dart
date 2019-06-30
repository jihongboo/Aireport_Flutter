import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  final Map<String, Map<String, double>> iaqi;

  DetailView({this.iaqi});

  @override
  Widget build(BuildContext context) {
    List<Map<String, double>> result = [];
    List<Color> colors = [
      Colors.greenAccent,
      Colors.lightBlueAccent,
      Colors.pink,
      Colors.purple[300],
      Colors.black54,
      Colors.red[400],
      Colors.red[400],
      Colors.yellow,
      Colors.cyan,
      Colors.amberAccent[400]
    ];
    List<IconData> icons = [
      Icons.wb_sunny,
      Icons.cloud,
      Icons.brightness_2,
      Icons.flash_on,
      Icons.grain,
      Icons.hdr_strong,
      Icons.toys,
      Icons.looks,
      Icons.accessibility,
      Icons.ac_unit
    ];
    iaqi.forEach((key, value) {
      result.add({key: value["v"]});
    });
    return Container(
        color: Color.fromARGB(240, 255, 255, 255),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Detail",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 40,
                      decoration: TextDecoration.none),
                ),
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, //横轴三个子widget
                        childAspectRatio: 1.0 //宽高比为1时，子widget
                    ),
                    itemCount: iaqi.length,
                    itemBuilder: (context, index) =>
                        DetailCell(
                          title: result[index].keys.first,
                          value: result[index].values.first,
                          color: colors[index],
                          icon: icons[index],)),
              ),
            ],
          ),
        ));
  }
}

class DetailCell extends StatelessWidget {
  final String title;
  final double value;
  final Color color;
  final IconData icon;

  DetailCell({this.title, this.value, this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            color: color,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(.0, 2.0),
                  blurRadius: 10.0,
              ),
            ]),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 14,
                        decoration: TextDecoration.none),
                ),
              ),
              Text(
                value.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.none),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';

class HistoryView extends StatefulWidget {
  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final titles = [
    "Co",
    "No2",
    "O3",
    "Pm10",
    "Pm2.5",
    "So2",
    "W",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[200],
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("History",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      decoration: TextDecoration.none)),
            ),
            Expanded(
              child: ListView.builder(
                  itemExtent: 240.0,
                  itemCount: titles.length,
                  itemBuilder: (BuildContext context, int index) =>
                      HistoryCell(title: titles[index],)),
            ),
          ],
        ),
      ),
    );
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

class HistoryCell extends StatelessWidget {
  final String title;
  HistoryCell({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  decoration: TextDecoration.none),
            ),
          ),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(.0, 1.0),
                        blurRadius: 8.0)
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Colors.white
                  ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: charts.BarChart(
                  _createSampleData(),
                  animate: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final List<OrdinalSales> data = [];
    final random = new Random();
    for(var i = 0; i < 10; i++) {
      data.add(OrdinalSales(i.toString(), random.nextInt(100)));
    }

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault.lighter,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

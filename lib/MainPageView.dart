import 'package:flutter/material.dart';
import 'Models/AirResponse.dart';
import 'HistoryView.dart';
import 'DetailView.dart';
import 'AQIView.dart';

class MainPageView extends StatefulWidget {
  final AirResponse response;
  final VoidCallback tap;
  final RouteObserver<PageRoute> routeObserver;

  const MainPageView({Key key, this.response, this.tap, this.routeObserver})
      : super(key: key);

  @override
  _MainPageViewState createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> with RouteAware {
  int aqi;
  String city;
  Map<String, Map<String, double>> iaqi;

  @override
  void initState() {
    super.initState();
    aqi = 0;
    city = "";
    iaqi = {};
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    widget.routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    StatusBarColorNotification(Colors.black).dispatch(context);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.response != null) {
      aqi = widget.response.data.aqi;
      city = widget.response.data.city.name;
      iaqi = widget.response.data.iaqi;
    }

    return PageView(
      controller: PageController(initialPage: 1),
      children: <Widget>[
        DetailView(iaqi: iaqi),
        AQIView(
          aqi: aqi,
          place: city,
          tap: widget.tap,
        ),
        HistoryView(),
      ],
    );
  }
}

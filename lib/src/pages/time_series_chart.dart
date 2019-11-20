import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}

class ItemDetailsPage extends StatefulWidget {
  @override
  _ItemDetailsPageState createState() => new _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  String url =
      "http://190.117.72.184:3009/riego/1";

  List dataJSON;

  Future<String> getCoinsTimeSeries() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json","content-type":"application/json"});

    setState(() {
      var extractdata = json.decode(response.body);
      dataJSON = extractdata["riegos"];
      var now = new DateTime.now();
      
      var date = dataJSON[1]['riego_fecha_ini'];
      var parseDate = DateTime.parse(date);
      var formatear = new DateFormat('dd,MM,yyyy');
       
      String formated = formatear.format(parseDate);

      
      

      print(formated);
    });
  }

  @override
  void initState() {
    this.getCoinsTimeSeries();
    
    
  }

  @override
  Widget build(BuildContext context) {

    List<TimeSeriesSales> data = [];
      // populate data with a list of dates and prices from the json
      if(dataJSON != null){
        for (Map m in dataJSON) {
         var parseDate = DateTime.parse(m['riego_fecha_ini']);
        
        data.add(TimeSeriesSales(parseDate, m['temperatura']));
      }
      }
      

    var series = [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];

    var chart = new charts.TimeSeriesChart(
      series,
      animate: true,
      animationDuration: Duration(seconds: 2) ,
       
    );

    var chartWidget = new Padding(
      padding: new EdgeInsets.all(32.0),
      child: new SizedBox(
        height: 500.0,
        child: chart,
      ),
    );

    return Scaffold(
      appBar: new AppBar(title: new Text("Temperatura del ambiente"),backgroundColor: Colors.lightGreen[400]),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Temperatura del ambiente con respecto al tiempo (C°):   ',
            ),
            chartWidget,
          ],
        ),
      ),
    );
  }
}
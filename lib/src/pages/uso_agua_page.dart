import 'dart:async';
import 'dart:convert';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';


class TimeSeriesAgua {
  final DateTime time;
  final int agua;

  TimeSeriesAgua(this.time, this.agua);
}

class UsoAguaPage extends StatefulWidget {

  final int areacod;
  UsoAguaPage(this.areacod);
  @override
  _UsoAguaPageState createState() => _UsoAguaPageState();
}

class _UsoAguaPageState extends State<UsoAguaPage> {

   

  List dataJSON;
  double agua_total = 0.00;

  Future getAguaTimeSeries(String date) async {
    String url =
      "http://190.117.72.184:3009/riego/fecha/${widget.areacod}/$date";

    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json","content-type":"application/json"});

    setState(() {
      var extractdata = json.decode(response.body);
      dataJSON = extractdata["riegos"];
   
    });
  }
@override
  void initState() {
    
    DateTime now = DateTime.now();
    var formateado = new DateFormat('yyyy-MM-dd');
    String formated = formateado.format(now);
    this.getAguaTimeSeries(formated);
    
  }




  @override
  Widget build(BuildContext context) {
    List<TimeSeriesAgua> data = [];
      // populate data with a list of dates and prices from the json
      if(dataJSON != null){
        double acumulador_agua = 0.00;
        for (Map m in dataJSON) {
         var parseDate = DateTime.parse(m['riego_fecha_ini']);

         acumulador_agua = acumulador_agua + m['medida_agua'];
        
        data.add(TimeSeriesAgua(parseDate, m['medida_agua']));
      }
      setState(() {
         agua_total = acumulador_agua/1000;
      });
        

      }

    
      

    var series = [
      new charts.Series<TimeSeriesAgua, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (TimeSeriesAgua sales, _) => sales.time,
        measureFn: (TimeSeriesAgua sales, _) => sales.agua,
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


    var datepicker = new RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      color: Colors.lightGreen[400],
        onPressed: () {
          DatePicker.showDatePicker(context,
            showTitleActions: true,
            minTime: DateTime(2000, 1, 1),
            maxTime: DateTime(2022, 12, 31),
            onChanged: (date) {print('change $date');},
            onConfirm: (date) {
              
              var formateado = new DateFormat('yyyy-MM-dd');
              String formatedd = formateado.format(date);
              print('confirm $formatedd');
              getAguaTimeSeries(formatedd);
              },
            currentTime: DateTime.now(), locale: LocaleType.en);},
      child: Text('Elija la fecha',),textColor: Colors.white
    );


    return Scaffold(
      appBar: new AppBar(title: new Text("Uso del agua"),backgroundColor: Colors.lightGreen[400]),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Uso del agua con respecto al tiempo (ml):   ',
            ),
            datepicker,
            chartWidget,
            Container(
              padding: EdgeInsets.all(25),
              child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.whatshot, color: Colors.blueAccent[400],),
                        title: Text("Uso de agua total: $agua_total litros"),
                        
                      )
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
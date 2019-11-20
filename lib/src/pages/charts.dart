/// Bar chart example

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
 
 class CharBar extends StatefulWidget {
   @override
   _CharBarState createState() => _CharBarState();
 }
 
 class _CharBarState extends State<CharBar> {

   List<charts.Series<Task,String>> _seriesPieData;

   void _generateData() {
     var pieData = [
       new Task('Work',35.8,Color(0xff3366cc)),
       new Task('Eat',8.8,Color(0xff990099)),
       new Task('Conmute',10.8,Color(0xff109698)),
       new Task('Tv',15.8,Color(0xfffedb19)),
       new Task('Sleep',19.8,Color(0xffff9900)),
       new Task('Other',10.8,Color(0xffdc3912)),
 
     ];

     _seriesPieData.add(
       charts.Series(
         data: pieData,
        domainFn: (Task task,_) => task.task,
        measureFn: (Task task,_) => task.taskvalue,
        colorFn: (Task task,_) => 
          charts.ColorUtil.fromDartColor(task.colorval),
          id: 'Daily Task',
          labelAccessorFn: (Task row,_) => '${row.taskvalue}',

         ),
     );
   }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesPieData =  List<charts.Series<Task,String>>();
    _generateData();
  }



   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Charbar"),
       ),
       body:   Container(
               child: Center(
                 child: Column(
                   children: <Widget>[
                     Text("Chart"),
                     Expanded(
                       child: charts.PieChart(
                         _seriesPieData,
                         animate: true,
                         animationDuration: Duration(seconds: 5),
                         behaviors: [
                           new charts.DatumLegend(
                             outsideJustification: charts.OutsideJustification.endDrawArea,
                             horizontalFirst: false,
                             desiredMaxRows: 2,
                             cellPadding: new EdgeInsets.only(right: 4.0,bottom: 4.0),
                             entryTextStyle: charts.TextStyleSpec(
                               color: charts.MaterialPalette.purple.shadeDefault,
                               fontFamily: 'Georgia',
                               fontSize: 11
                             )
                             
                           )
                         ],
                         defaultRenderer: new charts.ArcRendererConfig(
                           arcWidth: 100,
                           arcRendererDecorators: [
                             new charts.ArcLabelDecorator(
                               labelPosition: charts.ArcLabelPosition.inside
                             )
                           ]
                         ),
                       ),
                     )
                   ],
                 ),
               ),
             ),
           );
       
      
   }

  
 }


 class Task {
   String task;
   double taskvalue;
   Color colorval;
    Task(this.task,this.taskvalue,this.colorval);
 }
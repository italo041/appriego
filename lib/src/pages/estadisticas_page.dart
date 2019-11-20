import 'package:appriego/src/pages/charts.dart';
import 'package:appriego/src/pages/estadisticas_humedad_page.dart';
import 'package:appriego/src/pages/time_series_chart.dart';
import 'package:appriego/src/pages/uso_agua_page.dart';
import 'package:flutter/material.dart';

class EstadisticasPage extends StatelessWidget {
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Estadisticas"),
        backgroundColor: Colors.lightGreen[400],
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Charts"),
            leading: Icon(Icons.timelapse,color: Colors.lightGreen[400],),
            trailing: Icon(Icons.keyboard_arrow_right,color:Colors.lightGreen[400]),
            onTap: (){
               

              final route = MaterialPageRoute(
                builder: (context) =>  CharBar(),
              );
              Navigator.push(context, route);
            },
          ),
          Divider(),
          ListTile(
            title: Text("Temperatura del ambiente"),
            leading: Icon(Icons.timelapse,color: Colors.lightGreen[400],),
            trailing: Icon(Icons.keyboard_arrow_right,color:Colors.lightGreen[400]),
            onTap: (){
               

              final route = MaterialPageRoute(
                builder: (context) =>  ItemDetailsPage(),
              );
              Navigator.push(context, route);
            },
          ),
          Divider(),
          ListTile(
            title: Text("Humedad del suelo"),
            leading: Icon(Icons.timelapse,color: Colors.lightGreen[400],),
            trailing: Icon(Icons.keyboard_arrow_right,color:Colors.lightGreen[400]),
            onTap: (){
               

              final route = MaterialPageRoute(
                builder: (context) =>  EstadisticasHumedadPage(),
              );
              Navigator.push(context, route);
            },
          ),
          
          Divider(),
          ListTile(
            title: Text("Uso del agua"),
            leading: Icon(Icons.timelapse,color: Colors.lightGreen[400],),
            trailing: Icon(Icons.keyboard_arrow_right,color:Colors.lightGreen[400]),
            onTap: (){
               

              final route = MaterialPageRoute(
                builder: (context) =>  UsoAguaPage(),
              );
              Navigator.push(context, route);
            },
          ),
          
          Divider(),
        ],
      )
    );
  }
}
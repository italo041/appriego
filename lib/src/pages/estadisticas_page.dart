
import 'package:appriego/src/pages/estadisticas_humedad_page.dart';
import 'package:appriego/src/pages/time_series_chart.dart';
import 'package:appriego/src/pages/uso_agua_page.dart';
import 'package:flutter/material.dart';

class EstadisticasPage extends StatelessWidget {
    final int areacod;
  EstadisticasPage(this.areacod);

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
            title: Text("Temperatura del ambiente"),
            leading: Icon(Icons.timelapse,color: Colors.lightGreen[400],),
            trailing: Icon(Icons.keyboard_arrow_right,color:Colors.lightGreen[400]),
            onTap: (){
               

              Navigator.push(context, 
                  new MaterialPageRoute(builder: (context)=> ItemDetailsPage(areacod))
                  ); 
            },
          ),
          Divider(),
          ListTile(
            title: Text("Humedad del suelo"),
            leading: Icon(Icons.timelapse,color: Colors.lightGreen[400],),
            trailing: Icon(Icons.keyboard_arrow_right,color:Colors.lightGreen[400]),
            onTap: (){
               
 
               Navigator.push(context, 
                  new MaterialPageRoute(builder: (context)=> EstadisticasHumedadPage(areacod))
                  ); 
            },
          ),
          
          Divider(),
          ListTile(
            title: Text("Uso del agua"),
            leading: Icon(Icons.timelapse,color: Colors.lightGreen[400],),
            trailing: Icon(Icons.keyboard_arrow_right,color:Colors.lightGreen[400]),
            onTap: (){
               

             

              Navigator.push(context, 
                  new MaterialPageRoute(builder: (context)=> UsoAguaPage(areacod))
                  ); 
            },
          ),
          
          Divider(),
        ],
      )
    );
  }
}
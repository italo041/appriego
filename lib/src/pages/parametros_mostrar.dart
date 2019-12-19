 
import 'package:appriego/src/models/area_model.dart';
import 'package:appriego/src/pages/parametros_page.dart';
import 'package:appriego/src/providers/parametros_provider.dart';
import 'package:flutter/material.dart';


class ParametrosPageInicial extends StatefulWidget {
  final int areacod;
  ParametrosPageInicial(this.areacod);
  
  
  @override
  _ParametrosPageInicialState createState() => _ParametrosPageInicialState();
}

class _ParametrosPageInicialState extends State<ParametrosPageInicial> {
  final parametroProvider = new ParametrosProvider();
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Tus parametros "),
        backgroundColor: Colors.lightGreen[400],
      ),
      body: _crearListado() 
      );
           
       
        
    
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: parametroProvider.cargarParametros(widget.areacod),
      builder: (BuildContext context,AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return ListView.builder(
            padding: EdgeInsets.all(20),
            itemCount: snapshot.data.length,
            itemBuilder: (context,index){
              return Column(
                children: <Widget>[
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.terrain, color: Colors.greenAccent[400],),
                          title: Text("Humedad Minima Tierra: ${snapshot.data[index].humMinTierra.toString()}"),
                          
                        )
                      ],
                    ),
                  ),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.brightness_low,color: Colors.greenAccent[400],),
                          title: Text("Temperatura Minima Ambiente: ${snapshot.data[index].tempMinAmbiente.toString()}"),
                          
                        )
                      ],
                    ),
                  ),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.brightness_high, color: Colors.greenAccent[400],),
                          title: Text("Temperatura Maxima Ambiente: ${snapshot.data[index].tempMaxAmbiente.toString()}"),
                          
                        )
                      ],
                    ),
                  ),
                  _crearBoton(context)
                ],
              );
              
              
            },
          );
        }else {
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }

  Widget _crearBoton(BuildContext context) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.lightGreen[500],
      textColor: Colors.white,
      label: Text("Actualizar Parametros"),
      icon: Icon(Icons.refresh),
      onPressed:()   {
        Navigator.push(context, 
                  new MaterialPageRoute(builder: (context)=> ParametrosPage(widget.areacod))
                  );
      },
    );
  }
}
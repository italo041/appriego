import 'package:appriego/main.dart';
import 'package:appriego/src/pages/home_page.dart';
import 'package:appriego/src/pages/uso_agua_page.dart';
import 'package:flutter/material.dart';
import 'package:appriego/src/providers/area_provider.dart';
import 'dart:async';
import 'package:appriego/src/models/area_model.dart';

class AreaPage extends StatefulWidget {
  
  @override
  _AreaPageState createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {
  final areaProvider = new AreaProvider();


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riego APP"),
        backgroundColor: Colors.lightGreen[400],
      ),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context)
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: areaProvider.cargarArea(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context,int index){
              return ListTile(
                leading: Icon(Icons.invert_colors,color: Colors.lightGreen,),
                title: Text(snapshot.data[index].areaNombre),
                subtitle: Text("Tamaño del area :${snapshot.data[index].areaTamao.toString()} m "),
                onTap: (){
                  Navigator.push(context, 
                  new MaterialPageRoute(builder: (context)=> HomePage(snapshot.data[index]))
                  );
                  
                },
                onLongPress: (){
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context){
                          return AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                            title: Text("Mensaje de informacion"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.delete,color: Colors.red[300],size:80,),
                                Text("¿Deseas borrar el area de riego?"),
                              ],
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("NO"),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                              FlatButton(
                                child: Text("YES"),
                                onPressed: () {
                                  
                                 
                                   setState(() {
                                     var objeto = {
                                    "area_cod":snapshot.data[index].areaCod
                                     };
                                     areaProvider.borrarArea(objeto);
                                   
                                   
                                   });
                                   Navigator.of(context).pop(); 
                                   
                                     
                                }
                                
                              )
                            ],
                          );
                          
                        }
                      );
                },
              );
            },
          
            
          );
        }else {
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'crearArea'),
      backgroundColor: Colors.lightGreen[400],
    );
  }
}
import 'package:appriego/main.dart';
import 'package:appriego/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:appriego/src/providers/area_provider.dart';
import 'dart:async';
import 'package:appriego/src/models/area_model.dart';

class AreaPage extends StatelessWidget {
  
  final areaProvider = new AreaProvider();

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riego APP"),
        backgroundColor: Colors.lightGreen[400],
      ),
      body: _crearListado()
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
              );
            },
          );
        }else {
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
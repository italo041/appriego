import 'package:appriego/src/models/area_model.dart';
import 'package:flutter/material.dart';
import 'package:appriego/src/providers/menu_provider.dart';
import 'package:appriego/src/utils/icono_string_util.dart';
 



class HomePage extends StatelessWidget {
   final AreaModel area;
   HomePage(this.area);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(area.areaNombre),
        backgroundColor: Colors.lightGreen[400],
      ),
      body: _lista()
    );
  }
 
  Widget _lista() {
 
    // menuProvider.cargarData()  
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context,AsyncSnapshot<List<dynamic>> snapshot){
        return ListView(
          children: _listaItems(snapshot.data, context),
        );

      },
    );
  }

    

    
  



  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt){

      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right,color:Colors.lightGreen[400]),
        onTap: () {

          Navigator.pushNamed(context, opt['ruta']);

          

          // final route = MaterialPageRoute(
          //   builder: (context) =>  ParametrosPage(),
          // );
          // Navigator.push(context, route);

        },
      );

      opciones..add(widgetTemp)
              ..add(Divider());
    });  

    return opciones;

  }

}
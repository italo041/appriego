import 'package:appriego/src/models/area_model.dart';
import 'package:appriego/src/pages/estadisticas_page.dart';
import 'package:appriego/src/pages/parametros_mostrar.dart';
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
      body: ListView(
        children: <Widget>[
              ListTile(
            title: Text("Parametros"),
            leading: getIcon("format_list_bulleted"),
            trailing: Icon(Icons.keyboard_arrow_right,color:Colors.lightGreen[400]),
            onTap: () {

              Navigator.push(context, 
                  new MaterialPageRoute(builder: (context)=> ParametrosPageInicial(area.areaCod))
                  );              
              

            },
          ),
           ListTile(
            title: Text("Estadisticas"),
            leading: getIcon("assessment"),
            trailing: Icon(Icons.keyboard_arrow_right,color:Colors.lightGreen[400]),
            onTap: () {

              Navigator.push(context, 
                  new MaterialPageRoute(builder: (context)=> EstadisticasPage(area.areaCod))
                  );
              

            },
          ),
        ],
      )
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

           

        },
      );

      opciones..add(widgetTemp)
              ..add(Divider());
    });  

    return opciones;

  }

}
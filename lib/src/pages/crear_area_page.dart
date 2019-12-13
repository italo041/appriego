 
 
import 'package:appriego/src/models/area_model2.dart';
import 'package:appriego/src/models/parametros_model.dart';
import 'package:appriego/src/providers/area_provider.dart';
import 'package:appriego/src/providers/parametros_provider.dart';
import 'package:appriego/src/utils/utils.dart' as utils;
import 'package:flutter/material.dart';

class CrearAreaPage extends StatefulWidget {

   

  @override
  _CrearAreaPageState createState() => _CrearAreaPageState();
}

class _CrearAreaPageState extends State<CrearAreaPage> {
  final formKey = GlobalKey<FormState>();
  AreaModel2 area = new AreaModel2();
  final areaProvider = new AreaProvider();
 
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Area"),
        backgroundColor: Colors.lightGreen[400],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _crearNombre(),
                _crearTempMinAmbiente(),
                _crearBoton()
              ],
            ),
          ),
        ),
      ),
      
    );
  }

   

  Widget _crearNombre() {
    return TextFormField(
      initialValue: area.areaNombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombre del Area'
      ),
      onSaved: (value) {
        area.areaNombre = value;
      },
      validator: (value){
        if(value.length <3 ){
          return "Ingrese el nombre del Area";
        }else {
          return null;
        }
      },
    );

  }

  Widget _crearTempMinAmbiente() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Tamaño del area m2'
      ),
      onSaved: (value) => area.areaTamao = int.parse(value) ,
      validator: (value) {
        if(utils.validacionArea(value)){
          return null;
        }else {
          return "Tamaño de area maximo ( 100 metros )";  
        }
      },
    );
  }


  Widget _crearBoton() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.lightGreen[500],
        textColor: Colors.white,
        label: Text("Registrar"),
        icon: Icon(Icons.refresh),
        onPressed:()  =>  _submit(context),
      ),
    );
  }

   

  void _submit(BuildContext context) {
    if(!formKey.currentState.validate()) return;

    formKey.currentState.save();
     
    print(area.areaNombre);
    print(area.areaTamao);

    var objeto = {
      "area_nombre":area.areaNombre,
      "area_tamaño":area.areaTamao,
      "tipo_riego_cod":1,
    };
     
    areaProvider.insertarArea(objeto);

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text("Mensaje de informacion"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Se inserto el area correctamente"),
              FlutterLogo(size: 100),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
        
      }
    );

  }

   

  
}
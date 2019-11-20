import 'package:appriego/src/models/area_model.dart';
import 'package:appriego/src/models/parametros_model.dart';
import 'package:appriego/src/providers/parametros_provider.dart';
import 'package:appriego/src/utils/utils.dart' as utils;
import 'package:flutter/material.dart';

class ParametrosPage extends StatefulWidget {

   

  @override
  _ParametrosPageState createState() => _ParametrosPageState();
}

class _ParametrosPageState extends State<ParametrosPage> {
  final formKey = GlobalKey<FormState>();
  ParametrosModel parametros = new ParametrosModel();
  final parametrosProvider = new ParametrosProvider();
 
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parametros"),
        backgroundColor: Colors.lightGreen[400],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _crearHumMinTierra(),
                _crearTempMinAmbiente(),
                _crearTempMaxAmbiente(),
                _crearBoton(),
                _crearBotonParamatroDefecto()
              ],
            ),
          ),
        ),
      ),
      
    );
  }

   

  Widget _crearHumMinTierra() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true), 
      decoration: InputDecoration(
        labelText: 'Humedad Minima Tierra'
      ),
      onSaved: (value) => parametros.humMinTierra = int.parse(value) ,
      validator: (value) {
        if(utils.validacionNumero(value)){
          return null;
        }else {
          return "Elija un numero del 0 a 100. El valor sera tomado como %";  
        }
      },
    );
  }

  Widget _crearTempMinAmbiente() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Temperatura Minima Ambiente'
      ),
      onSaved: (value) => parametros.tempMinAmbiente = int.parse(value) ,
      validator: (value) {
        if(utils.validacionNumero(value)){
          return null;
        }else {
          return "Elija un numero del 0 a 100. El valor sera tomado como C°";  
        }
      },
    );
  }

  Widget _crearTempMaxAmbiente() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Temperatura Maxima Ambiente'
      ),
       onSaved: (value) => parametros.tempMaxAmbiente = int.parse(value) ,
      validator: (value) {
        if(utils.validacionNumero(value)){
          return null;
        }else {
          return "Elija un numero del 0 a 100. El valor sera tomado como C°";  
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
        label: Text("Actualizar"),
        icon: Icon(Icons.refresh),
        onPressed:()  =>  _submit(context),
      ),
    );
  }

  Widget _crearBotonParamatroDefecto() {
    return Padding(
      padding: const EdgeInsets.only(top: 300),
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.lightBlueAccent[400],
        textColor: Colors.white,
        label: Text("Actualizar Parametros por Defecto"),
        icon: Icon(Icons.refresh),
        onPressed:()  =>  _submitParametrosDefecto(context),
      ),
    );
  }

  void _submit(BuildContext context) {
    if(!formKey.currentState.validate()) return;

    formKey.currentState.save();
     
    print(parametros.humMinTierra);
    print(parametros.tempMinAmbiente);
    print(parametros.tempMaxAmbiente);

    var objeto = {
      "area_cod":1,
      "hum_min_tierra":parametros.humMinTierra,
      "temp_min_ambiente":parametros.tempMinAmbiente,
      "temp_max_ambiente":parametros.tempMaxAmbiente,
    };
     
    parametrosProvider.actualizarParametros(objeto);

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
              Text("Se actualizaron tus parametros de riego"),
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

  _submitParametrosDefecto(BuildContext context) {

    var objeto = {
      "area_cod":1,
      "hum_min_tierra":30,
      "temp_min_ambiente":30,
      "temp_max_ambiente":30,
    };
     
    parametrosProvider.actualizarParametros(objeto);

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
              Text("Se actualizaron tus parametros de riego por defecto"),
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
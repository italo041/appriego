
import 'dart:convert';

import 'package:appriego/src/models/parametros_model.dart';
import 'package:appriego/src/models/parametros_model2.dart';

import 'package:http/http.dart' as http;

class ParametrosProvider {
  final String _url = "http://190.117.72.184:3009";

  Future actualizarParametros(body ) async {

    final url = '$_url/parametros/actualizarParametros';

    final resp = await http.post(url,body:jsonEncode(body),
     headers: {"content-type": "application/json","accept" : "application/json"}).then((response){
       if(response.statusCode == 200){
         print("Se registro los datos");
       }
    });
 
  
    
  }

  Future<List<ParametrosModel2>> cargarParametros(idArea) async {
    final url = '$_url/parametros/$idArea';
    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);
     
    final List<ParametrosModel2> parametros = [];

    if( decodedData == null) return [];
 
    for(var a in decodedData['parametros']){
      ParametrosModel2 parametro = ParametrosModel2(a['area_cod'],a['hum_min_tierra'],a['temp_min_ambiente'],a['temp_max_ambiente']);
      
      parametros.add(parametro);

    }
    print(parametros.length);
    return parametros;
  }

}
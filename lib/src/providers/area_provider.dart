import 'dart:convert';

import 'package:appriego/src/models/area_model.dart';
import 'package:http/http.dart' as http;

class AreaProvider {
  final String _url = "http://190.117.72.184:3009";

  Future<List<AreaModel>> cargarArea() async {
    final url = '$_url/area';
    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);
     
    final List<AreaModel> areas = [];

    if( decodedData == null) return [];
 
    for(var a in decodedData['areas']){
      AreaModel area = AreaModel(a['area_cod'],a['area_nombre'],a['area_tamaño'],a['tiporiego_cod'],a['parametros_cod']);
      
      areas.add(area);

    }
    print(areas.length);
    return areas;
  }


   Future insertarArea(body ) async {

    final url = '$_url/area/insertar';

    final resp = await http.post(url,body:jsonEncode(body),
     headers: {"content-type": "application/json","accept" : "application/json"}).then((response){
       if(response.statusCode == 200){
         print("Se registro los datos");
       }
    });

    
  }
}
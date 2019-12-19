import 'package:appriego/src/pages/crear_area_page.dart';
import 'package:flutter/material.dart';

import 'package:appriego/src/pages/area_page.dart';
import 'package:appriego/src/pages/modoriego_page.dart';
import 'package:appriego/src/pages/parametros_mostrar.dart';
import 'package:appriego/src/pages/estadisticas_page.dart';
import 'package:appriego/src/pages/parametros_page.dart';

Map <String, WidgetBuilder> getApplicationRoutes(){
 return <String,WidgetBuilder> {
        '/' : (BuildContext context) => AreaPage(),
        'modoriego' : (BuildContext context) => ModoriegoPage(),
        'crearArea' : (BuildContext context) => CrearAreaPage(),

};
}
  
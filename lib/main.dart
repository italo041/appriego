import 'package:flutter/material.dart';
import 'package:appriego/src/pages/home_page.dart';
import 'package:appriego/src/pages/modoriego_page.dart';
import 'package:appriego/src/pages/parametros_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riego APP',
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      initialRoute: '/',
      routes: <String,WidgetBuilder> {
        '/' : (BuildContext context) => HomePage(),
        'parametros' : (BuildContext context) => ParametrosPage(),
        'modoriego' : (BuildContext context) => ModoriegoPage(),

      },
       
    );
  }
}
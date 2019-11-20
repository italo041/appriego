 
 
import 'package:flutter/material.dart';
import 'package:appriego/src/routes/routes.dart';
 
 
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riego APP',
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
       
    );
  }
}
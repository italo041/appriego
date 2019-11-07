import 'package:flutter/material.dart';

class ParametrosPage extends StatelessWidget {
  const ParametrosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parametros"),
        backgroundColor: Colors.lightGreen[400],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_left),
        onPressed: (){
          Navigator.pop(context);
        },
        backgroundColor: Colors.lightGreen[400],
      ),
    );
  }
}
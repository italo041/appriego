import 'package:flutter/material.dart';

class ModoriegoPage extends StatelessWidget {
  const ModoriegoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modo de Riego"),
        backgroundColor: Colors.lightGreen[400],
      ),
    );
  }
}

import 'package:flutter/material.dart';

final _icons = <String,IconData> {
  'format_list_bulleted'     : Icons.format_list_bulleted,
  'settings_applications' : Icons.settings_applications, 
  'assessment'   : Icons.assessment,
};

Icon getIcon (String nombreIcono){
   return Icon(_icons[nombreIcono], color: Colors.lightGreen[400],);
}
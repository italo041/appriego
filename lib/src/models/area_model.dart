// To parse this JSON data, do
//
//     final areaModel = areaModelFromJson(jsonString);

import 'dart:convert';

 

class AreaModel {
    final int areaCod;
    final String areaNombre;
    final int areaTamao;
    final int tiporiegoCod;
    final int parametrosCod;

    AreaModel(
        this.areaCod,
        this.areaNombre,
        this.areaTamao,
        this.tiporiegoCod,
        this.parametrosCod,
    );

     
}

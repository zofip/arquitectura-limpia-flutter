import 'package:arquitectura/infraestructure/driven-adapters/api-rest-mock/api-rest-mock.dart';
import 'package:flutter/material.dart';

import 'domain/usecase/solicitud_usecase.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);

  SolicitudUseCase solicitudUseCase = SolicitudUseCase(solicitudGateway: ApiRestMock());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(builder: (context, asyncSnapshot) {
        if(asyncSnapshot.hasError) {
          print("Error");
        } else if(!asyncSnapshot.hasData) {
          print("No hay datos");
        } else {
          print(asyncSnapshot.data);
        }
      }, future: solicitudUseCase.getAllSolicitudes())
    );
  }
}

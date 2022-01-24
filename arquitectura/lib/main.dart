import 'package:arquitectura/domain/model/gateway/solicitud_gateway.dart';
import 'package:arquitectura/infraestructure/driven-adapters/api-rest-mock/api-rest-mock.dart';
import 'package:arquitectura/infraestructure/driven-adapters/api-rest/api-res.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'domain/model/solicitud.dart';
import 'domain/usecase/solicitud_usecase.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers(0),
      builder: (context, child) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: FutureBuilder(
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.hasError) {
                    print("Error");
                  } else if (!asyncSnapshot.hasData) {
                    print("No hay datos");
                  } else {
                    print(asyncSnapshot.data);
                    List<Solicitud>? solicitud =
                        asyncSnapshot.data as List<Solicitud>?;
                    print(solicitud![0].name);
                    return Container(
                      child: Text(solicitud[0].name),
                    );
                  }
                  return Container();
                },
                future: Provider.of<SolicitudUseCase>(context)
                    .getAllSolicitudes()));
      },
    );
  }

  List<SingleChildWidget> providers(int env) {
    SolicitudGateway gateway = (env == 0) ? ApiRestMock() : ApiRest();
    return [
      Provider<SolicitudUseCase>(
          create: (_) => SolicitudUseCase(solicitudGateway: gateway)),
    ];
  }
}

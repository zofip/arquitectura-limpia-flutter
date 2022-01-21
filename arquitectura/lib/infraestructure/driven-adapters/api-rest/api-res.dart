
import "package:http/http.dart" as http;

import 'package:arquitectura/domain/model/gateway/solicitud_gateway.dart';
import 'package:arquitectura/domain/model/solicitud.dart';

class ApiRest extends SolicitudGateway {
  
  @override
  Future<Solicitud> create(Solicitud solicitud) async {

    Solicitud solicitud = http.get(Uri.parse("http://")) as Solicitud;
    return solicitud;
  }

  @override
  Future<List<Solicitud>> getS() async {
    List<Solicitud> solicitudes = http.get(Uri.parse("http://")) as List<Solicitud>;
    return solicitudes;
  }
  
}
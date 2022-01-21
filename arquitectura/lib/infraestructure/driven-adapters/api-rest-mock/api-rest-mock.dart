import 'package:arquitectura/domain/model/gateway/solicitud_gateway.dart';
import 'package:arquitectura/domain/model/solicitud.dart';

import 'mocks/solicitudes-mocks.dart';

class ApiRestMock extends SolicitudGateway {

  @override
  Future<Solicitud> create(Solicitud solicitud) async {
    return solicitudMock;
  }

  @override
  Future<List<Solicitud>> getS() async {
    return solicitudesMock;
  }

}
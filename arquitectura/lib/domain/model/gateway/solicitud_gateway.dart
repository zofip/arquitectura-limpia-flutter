import '../solicitud.dart';

abstract class SolicitudGateway {

  Future<List<Solicitud>> getS();
  Future<Solicitud> create(Solicitud solicitud);

}
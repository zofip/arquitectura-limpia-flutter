import 'package:arquitectura/domain/model/gateway/solicitud_gateway.dart';
import 'package:arquitectura/domain/model/solicitud.dart';

class SolicitudUseCase {

  SolicitudGateway solicitudGateway;

  SolicitudUseCase({
    required this.solicitudGateway
  });

  Future<List<Solicitud>> getAllSolicitudes() {
    return solicitudGateway.getS();
  }

  Future<Solicitud> createSolicitud() {
    return solicitudGateway.create(Solicitud(name: 'Solicitud', city: 'Itagui'));
  }

}
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:car_crud_dart/routes/routes.dart';

void main() async {
  final router = getRoutes();
  final handler = Pipeline().addMiddleware(corsHeaders()).addHandler(router);

  final server = await io.serve(handler, 'localhost', 8080);
  print('Servidor rodando em http://${server.address.host}:${server.port}');
}

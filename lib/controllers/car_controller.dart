import 'package:car_crud_dart/services/car_service.dart';
import 'dart:convert';
import 'package:shelf/shelf.dart';

class CarController {
  final CarService _service;

  CarController(this._service);

  // get all cars endpoint
  Response getCars(Request request) {
    final cars = _service.getCars();
    if (cars.isEmpty) {
      Response.badRequest(body: 'NO_CARS_AVAILABLE');
    }
    return Response.ok(
      jsonEncode(cars.map((u) => u.toJson()).toList()),
      headers: {'Content-Type': 'application/json'},
    );
  }

  // get car by id endpoint
  Response getCar(Request request, String idStr) {
    final id = int.tryParse(idStr);
    if (id == null) return Response.badRequest(body: "INVALID_ID");

    final car = _service.getCarsById(id);
    if (car == null) {
      return Response.badRequest(body: "CAR_NOT_FOUND");
    }

    return Response.ok(
      jsonEncode(car.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
  }

  // get cars by brand endpoint
  Response getCarsByBrand(Request request, String brand) {
    if (brand.isEmpty) return Response.badRequest(body: "INVALID_BRAND");

    final cars = _service.getCarsByBrand(brand);
    if (cars == null) {
      return Response.badRequest(body: "CARS_NOT_FOUND");
    }

    return Response.ok(
      jsonEncode(cars.map((u) => u.toJson()).toList()),
      headers: {'Content-Type': 'application/json'},
    );
  }

  // get cars by year endpoint
  Response getCarsByYear(Request request, String yearStr) {
    final year = int.tryParse(yearStr);
    if (year == null) return Response.badRequest(body: "INVALID_YEAR");

    final cars = _service.getCarsByYear(year);
    if (cars == null) {
      return Response.badRequest(body: "CARS_NOT_FOUND");
    }

    return Response.ok(
      jsonEncode(cars.map((u) => u.toJson()).toList()),
      headers: {'Content-Type': 'application/json'},
    );
  }

  // create car endpoint
  Future<Response> createCar(Request request) async {
    final payload = await request.readAsString();
    final data = jsonDecode(payload);

    _service.createCar(
      data['brand'],
      data['model'],
      data['engine'],
      data['engineCode'],
      data['year'],
      data['horsepower'],
      data['price'],
      data['weight'],
    );
    return Response.ok(
      jsonEncode({'message': 'CAR_CREATED'}),
      headers: {'Content-Type': 'application/json'},
    );
  }

  // update car endpoint
  Future<Response> updateCar(Request request, String idStr) async {
    final id = int.tryParse(idStr);
    if (id == null) return Response.badRequest(body: 'INVALID_ID');
    final payload = await request.readAsString();
    final data = jsonDecode(payload);
    final success = _service.updateCar(
      id,
      data['brand'],
      data['model'],
      data['engine'],
      data['engineCode'],
      data['year'],
      data['horsepower'],
      data['price'],
      data['weight'],
    );
    if (!success) return Response.notFound('Usuário não encontrado');
    return Response.ok(
      jsonEncode({'message': 'Usuário atualizado'}),
      headers: {'Content-Type': 'application/json'},
    );
  }

  // delete car endpoint
  Response deleteCar(Request request, String idStr) {
    final id = int.tryParse(idStr);
    if (id == null) return Response.badRequest(body: 'INVALID_ID');
    final success = _service.deleteCar(id);
    if (!success) return Response.notFound('CAR_NOT_FOUND');
    return Response.ok(
      jsonEncode({'message': 'CAR_DELETED'}),
      headers: {'Content-Type': 'application/json'},
    );
  }
}

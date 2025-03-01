import '../models/car.dart';
import 'package:collection/collection.dart';

class CarRepository {
  final List<Car> _cars = [];

  void create(Car car) {
    _cars.add(car);
  }

  List<Car> getAll() {
    return _cars;
  }

  Car? getById(int id) {
    return _cars.firstWhereOrNull((car) => car.id == id);
  }

  List<Car> getByBrand(String brand) {
    return _cars.where((car) => car.brand == brand).toList();
  }

  List<Car> getByYear(int year) {
    return _cars.where((car) => car.year == year).toList();
  }

  bool update(int id, Car updatedCar) {
    final index = _cars.indexWhere((car) => car.id == id);
    if (index != -1) {
      _cars[index] = updatedCar;
      return true;
    } else {
      return false;
    }
  }

  bool delete(int id) {
    final index = _cars.indexWhere((car) => car.id == id);
    if (index != -1) {
      _cars.removeAt(index);
      return true;
    } else {
      return false;
    }
  }
}

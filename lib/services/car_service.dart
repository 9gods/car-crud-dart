import '../models/car.dart';
import '../repositories/car_repository.dart';

class CarService {
  final CarRepository _repository;

  CarService(this._repository);

  List<Car> getCars() => _repository.getAll();
  List<Car>? getCarsByBrand(String brand) => _repository.getByBrand(brand);
  List<Car>? getCarsByYear(int year) => _repository.getByYear(year);
  Car? getCarsById(int id) => _repository.getById(id);

  void createCar(
    String brand,
    String model,
    String engine,
    String engineCode,
    int year,
    int horsepower,
    int price,
    int weight,
  ) {
    final newCar = Car(
      id: _repository.getAll().length + 1,
      brand: brand,
      model: model,
      engine: engine,
      engineCode: engineCode,
      horsepower: horsepower,
      price: price,
      weight: weight,
      year: year,
    );
    _repository.create(newCar);
  }

  bool updateCar(
    int id,
    String brand,
    String model,
    String engine,
    String engineCode,
    int year,
    int horsepower,
    int price,
    int weight,
  ) {
    final existingCar = _repository.getById(id);
    if (existingCar == null) return false;
    final updatedCar = Car(
      id: id,
      brand: brand,
      model: model,
      engine: engine,
      engineCode: engineCode,
      horsepower: horsepower,
      price: price,
      weight: weight,
      year: year,
    );

    return _repository.update(id, updatedCar);
  }

  bool deleteCar(int id) => _repository.delete(id);
}

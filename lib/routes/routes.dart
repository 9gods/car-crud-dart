import 'package:shelf_router/shelf_router.dart';
import '../controllers/car_controller.dart';
import '../services/car_service.dart';
import '../repositories/car_repository.dart';

Router getRoutes() {
  final router = Router();

  // deps configuration
  final repository = CarRepository();
  final service = CarService(repository);
  final controller = CarController(service);

  // endpoints mapping
  router.get('/cars', controller.getCars);
  router.get('/cars/<brand>', controller.getCarsByBrand);
  router.get('/cars/<year>', controller.getCarsByYear);
  router.get('/cars/<id>', controller.getCar);
  router.post('/users', controller.createCar);
  router.put('/cars/<id>', controller.updateCar);
  router.delete('/cars/<id>', controller.deleteCar);

  return router;
}

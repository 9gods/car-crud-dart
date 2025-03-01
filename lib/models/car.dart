class Car {
  String brand;
  String model;
  String engine;
  String engineCode;
  int year;
  int horsepower;
  int price;
  int weight;
  // File carPhoto;

  Car({
    required this.brand,
    required this.model,
    required this.engine,
    required this.engineCode,
    required this.year,
    required this.horsepower,
    required this.price,
    required this.weight,
    // required File carPhoto,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      brand: json['brand'],
      model: json['model'],
      engine: json['engine'],
      engineCode: json['engineCode'],
      year: json['year'],
      horsepower: json['horsepower'],
      price: json['price'],
      weight: json['weight'],
      // carPhoto: json['carPhoto'] as File,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'model': model,
      'engine': engine,
      'engineCode': engineCode,
      'year': year,
      'horsepower': horsepower,
      'price': price,
      'weight': weight,
      // 'carPhoto': carPhoto.path,
    };
  }
}

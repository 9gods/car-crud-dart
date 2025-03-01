# CRUD for Cars in Dart

This project is a simple example I created to study Dart. It implements a CRUD (Create, Read, Update, Delete) for managing cars using a layered architecture. It demonstrates simple better practices for developing RESTful APIs with Dart.

---

## Features

- **Create, read, update, and delete cars.**
- **Modular organization:** Each layer (Model, Repository, Service, Controller, and Routes) has a single responsibility.
- **CORS Middleware:** Allows communication with front-end applications hosted on different domains.
- **CLI Arguments:** Custom configuration using the `args` package.

---

## Dependencies Used

- **shelf:** ^1.4.1  
  A minimalist, modular HTTP server.
- **shelf_router:** ^1.1.4  
  Simplified routing for Shelf.
- **shelf_cors_headers:** ^0.1.5  
  CORS support for the API.
- **collection:** ^1.16.0  
  Utilities for working with collections.
- **args:** ^2.6.0  
  Command-line argument parsing.

---

## Requirements

- [Dart SDK](https://dart.dev/get-dart) (stable version)
- A code editor (VS Code, IntelliJ, etc.)
- Familiarity with basic programming and HTTP concepts

---

## Project Structure

The project is organized following simple practices to ensure scalability and maintainability:

```
/crud_carros
├── bin
│   └── server.dart           # Application entry point, starts the server
├── lib
│   ├── controllers           # Manages HTTP requests and interacts with services
│   │   └── car_controller.dart
│   ├── models                # Defines the data structure (Car entity)
│   │   └── car.dart
│   ├── repositories          # Data persistence layer (currently in-memory storage)
│   │   └── car_repository.dart
│   ├── routes                # Maps routes to controllers
│   │   └── routes.dart
│   └── services              # Business logic and specific validations
│       └── car_service.dart
├── pubspec.yaml              # Project dependency management
└── README.md                 # This file
```

---

## Setup and Execution

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/9gods/car-crud-dart.git
   cd car-crud-dart
   ```
2. Install the dependencies:
   ```bash
   dart pub get
   ```

### Running the Server

To start the server, run:
```bash
dart run bin/server.dart
```
The server will start on the default port **8080**.

---

## API Endpoints

The API exposes the following endpoints to manage cars:

- **GET /cars**  
  Returns a list of all cars.  
  **Response:**  
  A JSON array of car objects.

- **GET /cars/{id}**  
  Returns the details of a specific car by its ID.  
  **Error Handling:**  
  - Returns `"INVALID_ID"` if the provided ID is not a valid integer.  
  - Returns `"CAR_NOT_FOUND"` if no car with that ID exists.

- **GET /cars/brand/{brand}**  
  Returns a list of cars filtered by brand.  
  **Error Handling:**  
  - Returns `"INVALID_BRAND"` if the brand parameter is empty.  
  - Returns `"CARS_NOT_FOUND"` if no cars matching the brand are found.

- **GET /cars/year/{year}**  
  Returns a list of cars filtered by year.  
  **Error Handling:**  
  - Returns `"INVALID_YEAR"` if the provided year is not a valid integer.  
  - Returns `"CARS_NOT_FOUND"` if no cars matching the year are found.

- **POST /cars**  
  Creates a new car.  
  **Expected Payload:**  
  ```json
  {
    "brand": "Volkswagen",
    "model": "Golf",
    "engine": "1.4L",
    "engineCode": "EA211",
    "year": 2014,
    "horsepower": 140,
    "price": 80000,
    "weight": 1300
  }
  ```  
  **Response:**  
  Returns a JSON message: `{"message": "CAR_CREATED"}`.

- **PUT /cars/{id}**  
  Updates an existing car by its ID.  
  **Expected Payload:**  
  ```json
  {
    "brand": "Volkswagen",
    "model": "Golf",
    "engine": "1.4L",
    "engineCode": "EA211",
    "year": 2014,
    "horsepower": 140,
    "price": 80200,
    "weight": 1300
  }
  ```  
  **Error Handling:**  
  - Returns `"INVALID_ID"` if the provided ID is not valid.  
  - Returns `"CAR_NOT_FOUND"` if no car with that ID exists.  
  **Response:**  
  Returns a JSON message indicating the car was updated (e.g., `{"message": "CAR_UPDATED"}`).

- **DELETE /cars/{id}**  
  Deletes a car by its ID.  
  **Error Handling:**  
  - Returns `"INVALID_ID"` if the provided ID is not valid.  
  - Returns `"CAR_NOT_FOUND"` if no car with that ID exists.  
  **Response:**  
  Returns a JSON message: `{"message": "CAR_DELETED"}`.

---

## Using Command-Line Arguments

The `args` package allows you to customize the server's execution. For example, to set a different port:
```bash
dart run bin/server.dart --port 9090
```
You can extend this functionality to include other configurations as needed.

---

## Contributing

Feel free to:
1. Fork the repository.
2. Create a branch for your modifications.
3. Submit a Pull Request with improvements, fixes, or new features.

---

## License

This project is licensed under the [MIT License](LICENSE).

---
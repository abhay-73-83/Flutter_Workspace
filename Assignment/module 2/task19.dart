void main()
{
  Car myCar = Car("Petrol", 180);
  Bike myBike = Bike("Diesel", 120);

  myCar.showDetails();
  myBike.showDetails();
}

class Vehicle
{
  String fuelType;
  int maxSpeed;

  Vehicle(this.fuelType, this.maxSpeed);
}

class Car extends Vehicle
{
  Car(String fuelType, int maxSpeed) : super(fuelType, maxSpeed);

  void showDetails()
  {
    print("Car -> Fuel: $fuelType, Max Speed: $maxSpeed km/h");
  }
}

// Bike subclass
class Bike extends Vehicle
{
  Bike(String fuelType, int maxSpeed) : super(fuelType, maxSpeed);

  void showDetails()
  {
    print("Bike -> Fuel: $fuelType, Max Speed: $maxSpeed km/h");
  }
}

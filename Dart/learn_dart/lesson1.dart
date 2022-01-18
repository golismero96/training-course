void main() {
  Car bmw = Car(km: 100, brand: 'BMW', color: 'Black', doganesoz: false);
  
  print(bmw.km);
  print(bmw.brand);
  print(bmw.color);
  print(bmw.doganesoz);
  bmw.turnOff();
}

class Car {
  int km;
  String brand;
  String color;
  bool doganesoz;
  
  Car({
    required this.km, 
    required this.brand, 
    required this.color, 
    required this.doganesoz
 });
  
  turnOff() {
    print("Car ${brand} is off");
  }
  
  turnOn(brand) {
    print("Car ${brand} is on");
  }
}

void main(List<String> arguments) {
  print('Hello World');
  String username = 'Mostafa dadfar';
  print(username);
  
  Car bmw = const Car(km: 100, brand: 'BMW', color: 'Gray', doganeSoz: false);
  print(bmw.brand);
  bmw.turnOff();
  

}

class Car{
  final int km;
  final String brand;
  final String color;
  final bool doganeSoz;

  const Car({
    required this.km,
    required this.brand,
    required this.color,
    required this.doganeSoz,
});

  turnOff(){
    print("Car $brand is off");
  }
  turnOn(){
    print("Car $brand is on");
  }
}
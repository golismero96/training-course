void main() {
//   restartMobile(
//       mobileType: Mobile(
//           name: '007',
//           brand: 'Golis',
//           cAt: 2022,
//           color: 'Blue',
//           status: false));

  // begin abstract
  Mobile apple = Apple(
      nameApple: 'Iphone 13',
      cAtApple: 2021,
      colorApple: 'Blue',
      statusApple: false);
  apple.test();
  // end abstract
  restartMobile(mobileType: apple);

  // begin abstract
  Mobile xiaomi = Xiaomi(
      nameXiaomi: 'Xiaomi Mix 5',
      cAtXiaomi: 2021,
      colorXiaomi: 'White',
      statusXiaomi: true);
  xiaomi.test();
  // end abstract
  restartMobile(mobileType: xiaomi);
}

restartMobile({required Mobile mobileType}) {
  print("*******************");
  mobileType.statusPhone();
  if (mobileType.status) {
    mobileType.changeStatusPhone(false);
    mobileType.turnOff();
    mobileType.statusPhone();
    mobileType.changeStatusPhone(true);
    mobileType.turnOn();
  } else {
    mobileType.changeStatusPhone(true);
    mobileType.turnOn();
    mobileType.statusPhone();
    mobileType.changeStatusPhone(false);
    mobileType.turnOff();
  }
  mobileType.statusPhone();
  print("*******************");
}

// abstract class
// az khode abstract class nemitavan estefade kard ***
abstract class Mobile {
  String name;
  String brand;
  int cAt;
  String color;
  bool status;

  Mobile(
      {required this.name,
      required this.brand,
      required this.cAt,
      required this.color,
      required this.status}) {
    print("Phone $brand Selected");
  }

  changeStatusPhone(status) {
    this.status = status;
  }

  statusPhone() {
    if (status) {
      print("Phone is Turn On");
    } else {
      print("Phone is Turn Off");
    }
  }

  turnOn() {
    print("Turn On...");
  }

  turnOff() {
    print("Turn Off...");
  }

  void test();
}

class Apple extends Mobile {
  Apple(
      {required String nameApple,
      required int cAtApple,
      required String colorApple,
      required bool statusApple})
      : super(
            brand: 'Apple',
            name: nameApple,
            cAt: cAtApple,
            color: colorApple,
            status: statusApple);
  @override
  changeStatusPhone(status) {
    this.status = status;
  }

  @override
  statusPhone() {
    if (status) {
      print("Iphone is Turn On");
    } else {
      print("Iphone is Turn Off");
    }
  }

  @override
  turnOn() {
    print("Apple Turn On...");
  }

  @override
  turnOff() {
    print("Apple Turn Off...");
  }

  @override
  void test() {
    print("Apple Tested. Phone is Ok");
  }
}

class Xiaomi extends Mobile {
  Xiaomi(
      {required String nameXiaomi,
      required int cAtXiaomi,
      required String colorXiaomi,
      required bool statusXiaomi})
      : super(
            brand: 'Xiaomi',
            name: nameXiaomi,
            cAt: cAtXiaomi,
            color: colorXiaomi,
            status: statusXiaomi);

  @override
  changeStatusPhone(status) {
    this.status = status;
  }

  @override
  statusPhone() {
    if (status) {
      print("Xiaomi is Turn On");
    } else {
      print("Xiaomi is Turn Off");
    }
  }

  @override
  turnOn() {
    print("Xiaomi Turn On...");
  }

  @override
  turnOff() {
    print("Xiaomi Turn Off...");
  }

  @override
  void test() {
    print("Xiaomi Tested. Phone is Ok");
  }
}

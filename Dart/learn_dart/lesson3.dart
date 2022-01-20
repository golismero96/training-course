void main() {
  restartMobile(
      mobileType: Mobile(
          name: '007',
          brand: 'Golis',
          cAt: 2022,
          color: 'Blue',
          status: false));

  restartMobile(
      mobileType: Apple(
          nameApple: 'Iphone 13 Pro Max',
          cAtApple: 2022,
          colorApple: 'Gold',
          statusApple: true));
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

class Mobile {
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
}

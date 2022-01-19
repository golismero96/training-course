void main() {
  Madrese madrese = Madrese(tedadMoaleman: 10, tedadDaneshAmozan: 500, tedaddaftar: 5);
  madrese.timeDars();

  
  Madrese2 mad2 = Madrese2(tedaddaftar2: 2, tedadDaneshAmozan2: 50);
  print('tedade daftar: ${mad2.tedaddaftar}');
  mad2.timeDars();
  mad2.zangtafrih();
}

class Madrese {
  int tedadMoaleman;
  int tedadDaneshAmozan;
  int tedaddaftar;

  Madrese({required this.tedadMoaleman, required this.tedadDaneshAmozan, required this.tedaddaftar});

  zangTafrih() {
    print("زمان استراحت");
  }
  timeDars() {
    print("زمان درس");
  }
}


class Madrese2 extends Madrese{
  Madrese2({required int tedaddaftar2, required int tedadDaneshAmozan2}):
  super(tedadMoaleman: 5, tedadDaneshAmozan: tedadDaneshAmozan2, tedaddaftar: tedaddaftar2) {
    print('info madrese 2');
    print('tedade moalem: ${tedadMoaleman}');
  }

  @override
  zangtafrih() {
    print("زمان غذا خوردن");
  }
}




import 'package:rxdart/rxdart.dart';

class BoolBloc{
  BehaviorSubject<bool> bloc = BehaviorSubject<bool>();
  Stream<bool> get stream$ => bloc.stream;
  bool get value => bloc.value;

  setValue(bool val)=> bloc.add(val);
}

class IntBloc{
  BehaviorSubject<int> bloc = BehaviorSubject<int>();
  Stream<int> get stream$ => bloc.stream;
  int get value => bloc.value;

  setValue(int val)=> bloc.add(val);
}
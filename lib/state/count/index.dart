import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {
  final int count;
  IncrementEvent({this.count = 1});
}

class DecrementEvent extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(int initialState) : super(initialState) {
    on<IncrementEvent>((event, emit) => emit(state + event.count));
  }
}

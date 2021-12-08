import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {
  final int count;
  IncrementEvent({this.count = 1});
}

class SetCountEvent extends CounterEvent {
  final int count;
  SetCountEvent(this.count);
}

class DecrementEvent extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(int initialState) : super(initialState) {
    on<IncrementEvent>((event, emit) => emit(state + event.count));
    on<SetCountEvent>((event, emit) => emit(event.count));
  }
}

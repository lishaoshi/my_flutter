import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoEvent {}

class UserInfoState {
  final String? name;
  UserInfoState({this.name});
  Map<String, dynamic> toJson() {
    return {"name": name};
  }
}

class UserInfoChange extends UserInfoEvent {
  final UserInfoState state;
  UserInfoChange({required this.state});
}

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  UserInfoBloc(UserInfoState initialState) : super(initialState) {
    on<UserInfoChange>((event, emit) => emit(event.state));
  }
}

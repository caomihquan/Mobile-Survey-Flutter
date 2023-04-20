import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/UserModel.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState()) {
    on<SetUser>(_handleSetUser);
    on<GetUser>((event, emit) {});
    on<RemoveUser>((event, emit) {});
  }

  Future<void> _handleSetUser(
    SetUser event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(
      EmployeeCode: event.user.EmployeeCode,
      EmployeeName: event.user.EmployeeName,
    ));
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

// @immutable
// abstract class UserState {}

// class UserInitial extends UserState {}

class UserState {
  const UserState({this.EmployeeCode = '', this.EmployeeName = ''});

  final String EmployeeCode;
  final String EmployeeName;

  UserState copyWith({
    String? EmployeeCode,
    String? EmployeeName,
  }) {
    return UserState(
      EmployeeCode: EmployeeCode ?? this.EmployeeCode,
      EmployeeName: EmployeeName ?? this.EmployeeName,
    );
  }
}

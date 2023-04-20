part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class GetUser extends UserEvent {}

class SetUser extends UserEvent {
  SetUser(this.user);
  final UserModel user;
}

class RemoveUser extends UserEvent {}

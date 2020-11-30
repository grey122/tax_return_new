part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<UserEntity> users;
  const UserLoaded([this.users = const []]);

  @override
  List<Object> get props => [users];

  @override
  String toString() => 'TodosLoaded { todos: $users }';
}

class UserDataNotLoaded extends UserState {}

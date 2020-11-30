part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUsers extends UserEvent {}

class AddUser extends UserEvent {
  final UserEntity user;

  const AddUser(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'AddTodo { todo: $user }';
}

class UpdateUser extends UserEvent {
  final UserEntity updatedUser;

  UpdateUser(this.updatedUser);

  @override
  List<Object> get props => [updatedUser];

  @override
  String toString() => 'UpdateTodo { updatedTodo: $updatedUser }';
}

class DeleteUser extends UserEvent {
  final UserEntity deleteUserData;

  DeleteUser(this.deleteUserData);

  @override
  List<Object> get props => [deleteUserData];

  @override
  String toString() => 'DeleteTodo { todo: $deleteUserData }';
}

class UserUpdated extends UserEvent {
  final List<UserEntity> users;

  UserUpdated(this.users);

  @override
  List<Object> get props => [users];
}

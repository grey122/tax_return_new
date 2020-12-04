import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tax_return/feature/tax_return/domain/entities/user_entity/user_entity.dart';
import 'package:tax_return/feature/tax_return/domain/repositories/repositories_export.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  StreamSubscription _userSubscription;

  UserBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(UserLoading());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUsers) {
      yield* _mapLoadUserToState();
    } else if (event is AddUser) {
      yield* _mapAddUserToState(event);
    } else if (event is UpdateUser) {
      yield* _mapUpdateUserToState(event);
    } else if (event is DeleteUser) {
      yield* _mapDeleteUserDataToState(event);
    } else if (event is UserUpdated) {
      yield* _mapUserUpdateToState(event);
    }
  }

  Stream<UserState> _mapLoadUserToState() async* {
    _userSubscription?.cancel();
    _userSubscription = _userRepository.users().listen(
          (users) => add(UserUpdated(users)),
        );
  }

  Stream<UserState> _mapAddUserToState(AddUser event) async* {
    _userRepository.addNewUserData(user: event.userData);
  }

  Stream<UserState> _mapUpdateUserToState(UpdateUser event) async* {
    _userRepository.updateUserData(event.updatedUser);
  }

  Stream<UserState> _mapDeleteUserDataToState(DeleteUser event) async* {
    _userRepository.deleteUserData(event.deleteUserData);
  }

  Stream<UserState> _mapUserUpdateToState(UserUpdated event) async* {
    yield UserLoaded(event.users);
  }
}

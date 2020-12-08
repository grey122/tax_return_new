import 'package:flutter/cupertino.dart';
import 'package:tax_return/feature/authentication/presentation/logic/logic_export.dart';
import 'package:tax_return/feature/tax_return/domain/entities/user_entity/user_entity_export.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

UserEntity userEntity(BuildContext context) {
  final user = context.bloc<AuthenticationBloc>().state.user;
  return UserEntity((b) => b
    ..userName = user.name
    ..emailAddress = user.email
    ..userContact = ''
    ..taxReturnType = ''
    ..citPage = {'company category': '', 'isYearsOfOperation': false}
        .build()
        .toBuilder());
}

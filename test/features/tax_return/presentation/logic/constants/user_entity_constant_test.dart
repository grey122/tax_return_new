import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tax_return/feature/authentication/presentation/logic/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:tax_return/feature/tax_return/presentation/logic/constants/constants_export.dart';

class MockAuthenticationBloc extends Mock implements AuthenticationBloc {}

//TODO: do that reso coder clean arcitectiure stuff
//TODO: this involves a widget text
// void main() {
//   group('user entity value test', () {
//     test('should rebuild with one value changed', () {
//       final user = userEntity();
//       final userebuild =
//           userEntity(null).rebuild((b) => b..userName = 'Edu ChukwuNonso');

//       expect(user, userebuild);
//     });
//   });
// }

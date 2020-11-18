part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.failureMessgae,
    this.failureCode,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
  });

  final Email email;
  final Password password;
  final FormzStatus status;
  final String failureCode;
  final String failureMessgae;

  @override
  List<Object> get props => [email, password, status, failureCode];

  LoginState copyWith({
    Email email,
    Password password,
    FormzStatus status,
    String failureCode,
    String failureMessage,
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        failureCode: failureCode ?? this.failureCode,
        failureMessgae: failureMessage ?? this.failureMessgae);
  }
}

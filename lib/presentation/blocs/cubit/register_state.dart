import 'package:equatable/equatable.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

class RegisterFormState extends Equatable {
  final Username username;
  final Email email;
  final Password password;
  final bool userCreated;

  const RegisterFormState({
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.userCreated = false,
  });

  RegisterFormState copyWith({
    Username? username,
    Email? email,
    Password? password,
    bool? userCreated,
  }) {
    return RegisterFormState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      userCreated: userCreated ?? this.userCreated,
    );
  }

  @override
  List<Object?> get props => [username, email, password, userCreated];
}

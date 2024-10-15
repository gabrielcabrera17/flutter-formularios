part of 'register_cubit.dart';

// estados del formulario
enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Username username;
  final Email email;
  final Password password;
  final bool isManagerApproved; // Aprobación del gerente

  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.isValid = true,
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.isManagerApproved = true, // Inicializado en falso
  });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Username? username,
    Email? email,
    Password? password,
    bool? isManagerApproved, // Aprobación del gerente
  }) =>
      RegisterFormState(
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        isManagerApproved: isManagerApproved ?? this.isManagerApproved,
      );

  @override
  List<Object> get props => [formStatus, isValid, username, email, password, isManagerApproved];
}

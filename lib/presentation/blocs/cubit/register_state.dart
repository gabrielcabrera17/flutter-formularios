part of 'register_cubit.dart';

//estados del formulario
enum FormStatus { invalid, valid, validating, posting}

class RegisterFormState extends Equatable {

  final FormStatus formStatus;
  final bool isValid;
  final Username username;
  final String email;
  final String password;

  const RegisterFormState({
    //valores iniciales en el constructor
    this.formStatus = FormStatus.invalid, 
    this.isValid = true,
    this.username = const Username.pure(), 
    this.email = '', 
    this.password = '',
    
  });

  //El metodo copywith nos servira para poder elegir un nuevo estado
  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Username? username,
    String? email,
    String? password
  }) => RegisterFormState(
    // si no  viene formstatus sera igual a this.formStatus y así con todos los demas
    formStatus: formStatus ?? this.formStatus,
    isValid: isValid ?? this.isValid,
    username: username ?? this.username,
    email: email ?? this.email,
    password: password ?? this.password
  );

  @override
  List<Object> get props => [ formStatus, isValid, username, email, password ];
}



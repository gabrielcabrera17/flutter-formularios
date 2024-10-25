import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:forms_app/presentation/blocs/cubit/register_state.dart';
import 'package:formz/formz.dart';



class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  // Método para manejar el envío del formulario
  void onSubmit() {
  

  emit(
    state.copyWith(
  
      username: Username.dirty(state.username.value),
      password: Password.dirty(state.password.value),
      email: Email.dirty(state.email.value),
     
    ),
  );

  
    print("Formulario válido. Creando usuario.");
    emit(state.copyWith(userCreated: true));

   


}


   void usernameChanged(String value) {
    final username = Username.dirty(value);
    emit(state.copyWith(username: username));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(email: email));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(password: password));
  }

}

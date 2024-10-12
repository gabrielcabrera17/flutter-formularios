import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:forms_app/infrastructure/inputs/password.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit(){
    print('Submit: $state');
  }

  //metodos para cuando el username, email y password
  void usernameChanged(String value){
    final username = Username.dirty(value);
    
    emit(
      state.copyWith(
        username: username,
        //al llamar validate pide el listado de campos y mandara a llamar la validación de cada uno de ellos
        //mando las otras intancias de mis inputs, porque la función de validación
        //necesita verificar cada uno de los campos para saber si es valido o no el formulario
        isValid: Formz.validate([username, state.password])
      )
    );
  }
  void emailChanged(String value){
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email])
      )
    );
  }
  void passwordChanged(String value){
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        //hago referencia al state por que en este punto no tengo referencia a los demás campos
        isValid: Formz.validate([password, state.username])
      )
    );
  }
}

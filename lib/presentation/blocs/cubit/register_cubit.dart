import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
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
        isValid: Formz.validate([username])
      )
    );
  }
  void emailChanged(String value){
    emit(
      state.copyWith(
        email: value,
      )
    );
  }
  void passwordChanged(String value){
    emit(
      state.copyWith(
        password: value,
      )
    );
  }
}

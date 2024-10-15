import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  // Método para manejar el envío del formulario
  void onSubmit() {
    if (!state.isManagerApproved) {
      print('No se puede enviar el formulario. El gerente aún no ha aprobado.');
      return;
    }

    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        username: Username.dirty(state.username.value),
        password: Password.dirty(state.password.value),
        email: Email.dirty(state.email.value),
        isValid: Formz.validate([state.username, state.password, state.email]),
      ),
    );

    print('Formulario enviado: $state');
  }

  // Métodos para cambiar el estado de los inputs
  void usernameChanged(String value) {
    final username = Username.dirty(value);
    emit(state.copyWith(username: username, isValid: Formz.validate([username, state.password, state.email])));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(email: email, isValid: Formz.validate([email, state.password, state.username])));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(password: password, isValid: Formz.validate([password, state.username, state.email])));
  }

  // Método para aprobar el formulario por el gerente
  void managerApproval(bool approved) {
    emit(state.copyWith(isManagerApproved: approved));
  }
}

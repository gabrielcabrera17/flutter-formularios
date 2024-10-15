import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: BlocProvider(
        create: (_) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;
    final isManagerApproved = registerCubit.state.isManagerApproved;

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de Usuario',
            onChanged: registerCubit.usernameChanged,
            errorMessage: username.errorMessage,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Correo Electrónico',
            onChanged: registerCubit.emailChanged,
            errorMessage: email.errorMessage,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: registerCubit.passwordChanged,
            errorMessage: password.errorMessage,
          ),
          const SizedBox(height: 20),

          // Botón para simular la aprobación del gerente
          FilledButton(
            onPressed: () {
              registerCubit.managerApproval(true);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Formulario aprobado por el gerente')),
              );
            },
            child: const Text('Aprobar Formulario por Gerente'),
          ),

          const SizedBox(height: 20),

          // Botón de crear usuario
          FilledButton.tonalIcon(
            onPressed: isManagerApproved
                ? () {
                    registerCubit.onSubmit();
                  }
                : null, // Solo habilitado si el gerente ha aprobado
            icon: const Icon(Icons.save),
            label: const Text('Crear Usuario'),
          ),
        ],
      ),
    );
  }
}

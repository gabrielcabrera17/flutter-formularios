import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';
import 'package:forms_app/presentation/blocs/cubit/register_cubit.dart';
import 'package:forms_app/presentation/blocs/cubit/register_state.dart';
import 'package:forms_app/presentation/screens/register_screen.dart';

final List<Widget> forms = [
  RegisterScreen(),
  RegisterScreen()
];

class FormContainer extends StatefulWidget {
  const FormContainer({super.key});

  @override
  State<FormContainer> createState() => _FormContainerState();
}

class _FormContainerState extends State<FormContainer> {
  final PageController pageviewController = PageController();

  void nextPage(BuildContext context) {
    final nextPage = pageviewController.page! + 1;
    if (nextPage < forms.length) {
      pageviewController.animateToPage(
        nextPage.toInt(),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView(
              controller: pageviewController,
              physics: const BouncingScrollPhysics(),
              children: forms,
            ),
            Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from: 15,
                delay: const Duration(seconds: 1),
                child: BlocBuilder<RegisterCubit, RegisterFormState>(
                  builder: (context, state) {
                    final isValid = state.username.value.isNotEmpty &&
                                    state.email.value.isNotEmpty &&
                                    state.password.value.isNotEmpty;

                    return FilledButton(
                      onPressed: isValid ? () {
                        context.read<RegisterCubit>().onSubmit(); // Llama a onSubmit
                        if (state.userCreated) nextPage(context); // Si el usuario fue creado, avanza a la siguiente página
                      } : null,
                      child: const Text('Siguiente'),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: 450,
              child: ElevatedButton(
                onPressed: () {
                  context.read<RegisterCubit>().onSubmit(); // Invoca el submit para probar
                },
                child: Text('Crear usuario'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

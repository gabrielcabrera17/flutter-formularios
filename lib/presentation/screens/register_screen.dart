import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';


class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) => context.read<RegisterCubit>().usernameChanged(value),
          decoration: InputDecoration(labelText: 'Username'),
        ),
        TextField(
          onChanged: (value) => context.read<RegisterCubit>().emailChanged(value),
          decoration: InputDecoration(labelText: 'Email'),
        ),
        TextField(
          onChanged: (value) => context.read<RegisterCubit>().passwordChanged(value),
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
      ],
    );
  }
}

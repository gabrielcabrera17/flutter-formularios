import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child:const _RegisterView() ,
        ) 
    );
  }
}


class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(size: 100,),

              _RegisterForm(),

              
              SizedBox(height: 20,),

             

              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

//Este global key me permite enlazar el key con el _formkey
  @override
  Widget build(BuildContext context) {

    //estare pendiente de ese cubit (referencia al cubit)
  final registerCubit = context.watch<RegisterCubit>();
  //llamamos el objeto de tipo username del estado de nuestro cubit y lo almacenamos en la variable usernaem
  final username = registerCubit.state.username;
  final password = registerCubit.state.password;
  final email = registerCubit.state.email;

    return  Form(
      child: Column(
        children: [

          CustomTextFormField(
            label: 'Nombre de Usuario',
            //para determinar cuando esto cambia o no, lo regreso a leer el cubir usernameChanged
            onChanged:registerCubit.usernameChanged,
            //reemplazamos validator por errorMessage
            errorMessage: username.errorMessage,
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(
            label: 'Correo Electronico',
            onChanged: registerCubit.emailChanged,
            errorMessage: email.errorMessage,
          ),
          const SizedBox(height: 10,),
            CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: registerCubit.passwordChanged,
            errorMessage: password.errorMessage,
          ),

          const SizedBox(height: 20,),

          FilledButton.tonalIcon(
            onPressed: () {

              //final isValid = _formKey.currentState!.validate();
              //if( !isValid ) return;
             
             registerCubit.onSubmit();
            }, 
            icon: Icon(Icons.save) ,
            label: Text('Crear Usuario'),
          ),
        ],
      )
      );
  }
}
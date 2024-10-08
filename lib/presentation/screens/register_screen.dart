import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}


class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              const FlutterLogo(size: 100,),

              const _RegisterForm(),

              
              const SizedBox(height: 20,),

             

              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return  Form(
      child: Column(
        children: [

          CustomTextFormField(
            label: 'Nombre de Usuario',
           
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(
            label: 'Correo Electronico',
           
          ),
          const SizedBox(height: 10,),
            CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
          ),

          const SizedBox(height: 20,),

          FilledButton.tonalIcon(
            onPressed: () {
              
            }, 
            icon: Icon(Icons.save) ,
            label: Text('Crear Usuario'),
          ),
        ],
      )
      );
  }
}
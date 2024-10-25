
import 'package:go_router/go_router.dart';

import 'package:forms_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/cubits',
      builder: (context, state) => const CubitCounterScreen(),
    ),

    GoRoute(
      path: '/counter-bloc',
      builder: (context, state) => const BlocCounterScreen(),
    ),
    GoRoute(
      path: '/new-user',
      builder: (context, state) =>  RegisterScreen(),
    ),
    GoRoute(
      path: '/form-multiples',
      builder: (context, state) => const FormContainer(),
    ),

  ]
);
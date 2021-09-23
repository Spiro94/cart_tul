import 'core/themes/app_theme.dart';

import 'depedency_injection/dependency_injection.dart';
import 'presentation/pages/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/routes.dart';
import 'package:flutter/material.dart';

import 'presentation/pages/home/bloc/home_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => instance<HomeBloc>()..add(GetProducts()),
        ),
        BlocProvider(
          create: (context) => instance<CartBloc>()..add(CartStarted()),
        )
      ],
      child: const MaterialWidget(),
    );
  }
}

class MaterialWidget extends StatelessWidget {
  const MaterialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CartTul',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

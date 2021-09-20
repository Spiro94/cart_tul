import 'package:cart_tul/depedency_injection/dependency_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/routes.dart';
import 'package:flutter/material.dart';

import 'presentation/pages/home/bloc/home_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => instance<HomeBloc>()..add(GetProducts()),
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
    return const MaterialApp(
      title: 'CartTul',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

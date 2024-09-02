import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/config/router/app_router.dart';
import 'package:flutter_challenge/infrastructure/api_service.dart';
import 'package:flutter_challenge/presentation/blocs/product_bloc.dart';
import 'package:flutter_challenge/presentation/blocs/theme_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductBloc(ApiService())),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Market App',
            theme: themeState.themeMode == ThemeMode.dark
                ? ThemeData.dark()
                : ThemeData.light(),
            routerConfig: router,
          );
        },
      ),
    );
  }
}

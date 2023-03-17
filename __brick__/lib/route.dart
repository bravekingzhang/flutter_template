import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/bloc/counter_bloc.dart';
import 'package:flutter_template/pages/home.dart';
import 'package:flutter_template/pages/second.dart';
import 'package:go_router/go_router.dart';

final GoRouter gRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => CounterBloc(),
          child: const MyHomePage(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'second',
          builder: (BuildContext context, GoRouterState state) {
            return const SecondPage();
          },
        ),
      ],
    ),
  ],
);

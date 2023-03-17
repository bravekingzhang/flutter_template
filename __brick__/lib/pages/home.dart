import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/bloc/counter_bloc.dart';
import 'package:flutter_template/cubit/setting_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    BlocProvider.of<CounterBloc>(context).add(CounterAddEvent());
  }

  void _decrementCounter() {
    BlocProvider.of<CounterBloc>(context).add(CounterDecEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        buildWhen: (previous, current) {
          if (current.states == CounterStates.success) return true;
          if (current.states == CounterStates.loading) {}
          return false;
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton.extended(
                  heroTag: "toSecondPage",
                  onPressed: () => context.go('/second'),
                  label: Text(AppLocalizations.of(context)!.toSecondPage),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.countTimes,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${BlocProvider.of<CounterBloc>(context).state.count}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      heroTag: "a",
                      onPressed: _decrementCounter,
                      tooltip: 'Decrement',
                      child: const FaIcon(FontAwesomeIcons.minus),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    FloatingActionButton(
                      heroTag: "b",
                      onPressed: _incrementCounter,
                      tooltip: 'Increment',
                      child: const FaIcon(FontAwesomeIcons.plus),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FaIcon(FontAwesomeIcons.language),
                    Switch(
                        value: BlocProvider.of<UserSettingCubit>(context)
                            .isEnglish,
                        onChanged: (value) =>
                            BlocProvider.of<UserSettingCubit>(context)
                                .switchLocale()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FaIcon(FontAwesomeIcons.moon),
                    Switch(
                      onChanged: (bool value) =>
                          BlocProvider.of<UserSettingCubit>(context)
                              .switchTheme(),
                      value:
                          BlocProvider.of<UserSettingCubit>(context).isDarkMode,
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

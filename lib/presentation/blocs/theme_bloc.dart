import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ThemeEvent {}

class ToggleTheme extends ThemeEvent {}

class ThemeState {
  final ThemeMode themeMode;
  ThemeState(this.themeMode);
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(ThemeMode.dark)) {
    on<ToggleTheme>((event, emit) {
      emit(ThemeState(
        state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
      ));
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/states/bloc/question_bloc.dart';
import 'package:pokedex/states/theme/theme_cubit.dart';
import 'package:pokedex/states/user/bloc/user_bloc.dart';

void main() async {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<UserBloc>(create: (context) => UserBloc()),
        BlocProvider<QuestionBloc>(create: (context) => QuestionBloc())
      ],
      child: PokedexApp(),
    ),
  );
}

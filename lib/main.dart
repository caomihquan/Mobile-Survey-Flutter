import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/core/network.dart';
import 'package:pokedex/states/theme/theme_cubit.dart';
import 'package:pokedex/states/user/bloc/user_bloc.dart';

void main() async {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<NetworkManager>(
          create: (context) => NetworkManager(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
          BlocProvider<UserBloc>(create: (context) => UserBloc())
        ],
        child: PokedexApp(),
      ),
    ),
  );
}

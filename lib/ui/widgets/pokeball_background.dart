import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/ui/widgets/main_app_bar.dart';

import '../../states/theme/theme_cubit.dart';

class PokeballBackground extends StatelessWidget {
  static const double _pokeballWidthFraction = 0.664;

  final Widget child;
  final Widget? floatingActionButton;

  const PokeballBackground({
    Key? key,
    required this.child,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [child],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}

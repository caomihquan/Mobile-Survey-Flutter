// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/data/categories.dart';
import 'package:pokedex/domain/entities/category.dart';
import 'package:pokedex/ui/widgets/pokeball_background.dart';
import 'package:pokedex/routes.dart';

import '../../../states/theme/theme_cubit.dart';
import '../../../states/user/bloc/user_bloc.dart';
import 'widgets/news_card.dart';
import 'widgets/category_card.dart';

part 'sections/pokemon_news.dart';
part 'sections/header_card_content.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  bool showTitle = false;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);

    super.initState();
  }

  @override
  void dispose() {
    if (_scrollController != null) {
      _scrollController.dispose();
    }

    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final offset = _scrollController.offset;
    final showTitle = offset > _HeaderCardContent.height - kToolbarHeight;

    // Prevent unneccesary rebuild
    if (this.showTitle == showTitle) return;

    setState(() {
      this.showTitle = showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _HeaderCardContent());
  }
}

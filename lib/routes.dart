import 'package:flutter/material.dart';
import 'package:pokedex/core/fade_page_route.dart';
import 'package:pokedex/ui/screens/home/home.dart';
import 'package:pokedex/ui/screens/login/login.dart';
import 'package:pokedex/ui/screens/progress/progress.dart';
import 'package:pokedex/ui/screens/survey/detail/surveyDetail.dart';
import 'package:pokedex/ui/screens/survey/surveyProgress/surveryProgress.dart';
import 'ui/screens/changepassword/changepassword.dart';

enum Routes {
  splash,
  login,
  home,
  pokedex,
  pokemonInfo,
  typeEffects,
  items,
  changepassword,
  progress,
  surveyprogress,
  listsurvey,
  detail
}

class _Paths {
  // static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String surveyprogress = '/surveyprogress';
  static const String progress = '/progress';
  static const String changepassword = '/changepassword';
  static const String itemsList = '/home/items';
  static const String detail = '/';
//surveyprogress/listsurvey/detail
  static const Map<Routes, String> _pathMap = {
    Routes.login: _Paths.login,
    Routes.changepassword: _Paths.changepassword,
    Routes.home: _Paths.home,
    Routes.surveyprogress: _Paths.surveyprogress,
    Routes.progress: _Paths.progress,
    Routes.items: _Paths.itemsList,
    Routes.detail: _Paths.detail,
  };

  static String of(Routes route) => _pathMap[route] ?? login;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  //static bool _isAuthenticated = UserSate.getUser() != '' ? true : false;

  static Route onGenerateRoute(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      //case _Paths.splash:
      //return _isAuthenticated ? FadeRoute(page: SplashScreen()) : FadeRoute(page: Login());
      //return FadeRoute(page: SplashScreen());
      case _Paths.login:
        return FadeRoute(page: Login());

      case _Paths.changepassword:
        return FadeRoute(page: ChangePassword());

      case _Paths.surveyprogress:
        return FadeRoute(page: SurveyProgress());

      case _Paths.progress:
        return FadeRoute(page: Progress());
      // case _Paths.listsurvey:
      //   return FadeRoute(page: ListSurvey());
      case _Paths.detail:
        return FadeRoute(page: SurveyDetail());

      case _Paths.home:
      default:
        return FadeRoute(page: HomeScreen());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}

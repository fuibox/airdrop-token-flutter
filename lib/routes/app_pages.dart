import 'package:airdrop_flutter/pages/loading/loading.dart';
import 'package:fluro/fluro.dart';
import 'package:get/get.dart';
import '../pages/card/card.dart';
import '../pages/games/games.dart';
import '../pages/home/home.dart';
import '../pages/friends/friends.dart';
import '../pages/login/login.dart';
import '../pages/pay/pay.dart';
import '../pages/earn/earn.dart';
import '../pages/tasks/tasks.dart';

class AppPages {
  static String initial = '/home';
  static String card = '/card';
  static String games = '/games';
  static String home = '/home';
  static String friends = '/friends';
  static String loading = '/loading';
  static String login = '/login';
  static String pay = '/pay';
  static String earn = '/earn';
  static String tasks = '/tasks';

  static final routes = [
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: card, page: () => CardScreen()),
    GetPage(name: games, page: () => GamesScreen()),
    GetPage(name: friends, page: () => FriendsScreen()),
    GetPage(name: loading, page: () => LoadingScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: pay, page: () => PayScreen()),
    GetPage(name: earn, page: () => EarnScreen()),
    GetPage(name: tasks, page: () => TasksScreen()),
  ];

  static void configureRoutes(FluroRouter router) {
    router.define(home,
        handler: Handler(handlerFunc: (context, params) => HomeScreen()));
    router.define(card,
        handler: Handler(handlerFunc: (context, params) => CardScreen()));
    router.define(games,
        handler: Handler(handlerFunc: (context, params) => GamesScreen()));
    router.define(friends,
        handler: Handler(handlerFunc: (context, params) => FriendsScreen()));
    router.define(loading,
        handler: Handler(handlerFunc: (context, params) => LoadingScreen()));
    router.define(login,
        handler: Handler(handlerFunc: (context, params) => LoginScreen()));
    router.define(pay,
        handler: Handler(handlerFunc: (context, params) => PayScreen()));
    router.define(earn,
        handler: Handler(handlerFunc: (context, params) => EarnScreen()));
    router.define(tasks,
        handler: Handler(handlerFunc: (context, params) => TasksScreen()));
  }
}

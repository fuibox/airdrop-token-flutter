import 'package:airdrop_flutter/pages/home/home_assets_details.dart';
import 'package:fluro/fluro.dart';
import 'package:get/get.dart';
import 'package:airdrop_flutter/pages/loading/loading.dart';
import 'package:airdrop_flutter/pages/card/card.dart';
import 'package:airdrop_flutter/pages/games/games.dart';
import 'package:airdrop_flutter/pages/home/home.dart';
import 'package:airdrop_flutter/pages/friends/friends.dart';
import 'package:airdrop_flutter/pages/login/login.dart';
import 'package:airdrop_flutter/pages/pay/pay.dart';
import 'package:airdrop_flutter/pages/earn/earn.dart';
import 'package:airdrop_flutter/pages/tasks/tasks.dart';
import 'package:airdrop_flutter/pages/home/home_leaderboard.dart';

class AppPages {
  static const String initial = '/home';
  static const String card = '/card';
  static const String games = '/games';
  static const String home = '/home';
  static const String friends = '/friends';
  static const String loading = '/loading';
  static const String login = '/login';
  static const String pay = '/pay';
  static const String earn = '/earn';
  static const String tasks = '/tasks';
  static const String assets = '/assets';
  static const String ranking = '/ranking';

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
    GetPage(name: assets, page: () => HomeAssetsDetailsScreen()),
    GetPage(name: ranking, page: () => HomeLeaderboardScreen()),
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
    router.define(assets,
        handler: Handler(
            handlerFunc: (context, params) => HomeAssetsDetailsScreen()));
    router.define(ranking,
        handler:
            Handler(handlerFunc: (context, params) => HomeLeaderboardScreen()));
  }
}

import 'package:flutter/material.dart';

class GamesScreen extends StatefulWidget {
  GamesScreen({Key? key}) : super(key: key);

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('games'),
    );
  }
}

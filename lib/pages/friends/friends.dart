import 'package:flutter/material.dart';

class FriendsScreen extends StatefulWidget {
  FriendsScreen({Key? key}) : super(key: key);

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('friends'),
    );
  }
}

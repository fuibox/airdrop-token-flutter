import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('card'),
    );
  }
}

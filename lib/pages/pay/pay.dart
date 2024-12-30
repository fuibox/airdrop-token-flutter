import 'package:flutter/material.dart';

class PayScreen extends StatefulWidget {
  PayScreen({Key? key}) : super(key: key);

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('pay'),
    );
  }
}

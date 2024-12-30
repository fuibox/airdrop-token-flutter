import 'package:flutter/material.dart';

class EarnScreen extends StatefulWidget {
  EarnScreen({Key? key}) : super(key: key);

  @override
  State<EarnScreen> createState() => _EarnScreenState();
}

class _EarnScreenState extends State<EarnScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('rewards'),
    );
  }
}

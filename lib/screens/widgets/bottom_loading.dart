import 'package:flutter/material.dart';

class BottomLoading extends StatelessWidget {
  const BottomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Center(
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 18.0,
        ),
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(8),
        minimumSize: const Size(35.0, 35.0),
        maximumSize: const Size(35.0, 35.0),
      ),
    );
  }
}

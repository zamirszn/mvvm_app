import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  const AppError({super.key, required this.errorText});
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: errorText.isNotEmpty,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          errorText,
          style: const TextStyle(color: Colors.red, fontSize: 18),
        ),
      ),
    );
  }
}

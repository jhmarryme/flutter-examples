import 'package:flutter/material.dart';

class ClearButton extends StatelessWidget {
  final FormFieldState? fieldState;

  const ClearButton({super.key, required this.fieldState});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          fieldState?.didChange(null);
        },
        icon: const Icon(Icons.clear));
  }
}

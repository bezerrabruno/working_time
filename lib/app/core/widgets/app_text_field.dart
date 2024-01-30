import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;

  final String hintText;
  final bool enabled;

  final Function()? onTap;

  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.enabled,
    this.onTap,
  });

  InputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.deepPurple),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: hintText,
            labelStyle: const TextStyle(color: Colors.deepPurple),
            border: border(),
            enabledBorder: border(),
            disabledBorder: border(),
            focusedBorder: border(),
            enabled: enabled,
          ),
        ),
      ),
    );
  }
}

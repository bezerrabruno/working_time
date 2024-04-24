import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChange;

  final String hintText;
  final bool enabled;
  final int mode;
  final int maxLines;

  final Function()? onTap;

  const AppTextField({
    super.key,
    required this.controller,
    this.onChange,
    required this.hintText,
    required this.enabled,
    this.mode = 0,
    this.maxLines = 1,
    this.onTap,
  });

  InputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide:
          BorderSide(color: mode == 0 ? Colors.deepPurple : Colors.white),
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
          cursorColor: mode == 0 ? Colors.deepPurple : Colors.white,
          onChanged: onChange,
          style: TextStyle(color: mode == 0 ? Colors.deepPurple : Colors.white),
          minLines: 1,
          maxLines: maxLines,
          decoration: InputDecoration(
            labelText: hintText,
            labelStyle:
                TextStyle(color: mode == 0 ? Colors.deepPurple : Colors.white),
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

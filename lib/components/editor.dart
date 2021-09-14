import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? newController;
  final String? newLabel;
  final String? newHint;
  final IconData? newIcon;

  Editor({
    this.newController,
    this.newLabel,
    this.newHint,
    this.newIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: newController,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: newIcon != null ? Icon(newIcon) : null,
          labelText: newLabel,
          hintText: newHint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

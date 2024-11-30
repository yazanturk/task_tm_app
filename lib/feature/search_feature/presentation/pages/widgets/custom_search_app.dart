import 'package:flutter/material.dart';

class CustomSearchApp extends StatelessWidget {
  const CustomSearchApp({
    super.key,
    required this.search,
    required this.onPress,
  });

  final TextEditingController search;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: search,
        decoration: InputDecoration(
          hintText: 'City name',
          disabledBorder: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
        ));
  }
}

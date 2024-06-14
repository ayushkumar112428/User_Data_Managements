import 'package:flutter/material.dart';

class TextFromFildes extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const TextFromFildes(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          gapPadding: 7,
          borderRadius: BorderRadius.circular(7),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          gapPadding: 7,
        ),
      ),
    );
  }
}

class ButtionStyle extends StatelessWidget {
  final String title;
  const ButtionStyle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double wSize = MediaQuery.of(context).size.width;
    return Container(
      height: 60,
      width: wSize,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}

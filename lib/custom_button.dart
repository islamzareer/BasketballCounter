import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String text;
  Function toDo;

  CustomButton({Key? key, required this.text, required this.toDo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(8),
        backgroundColor: Colors.white30,
        minimumSize: const Size(150, 50),
      ),
      onPressed: () {
        toDo();
      },
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
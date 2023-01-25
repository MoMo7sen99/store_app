import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  CustomBottom({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 15),
        color: Colors.indigo,
        child: const Text("Update",
          style: TextStyle(
              color: Colors.white
          ),
        ) ,
        onPressed: onPressed
    );
  }
}

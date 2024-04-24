import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String myButtonText;
  final Color myButtonColor;
  const MyButton(
      {super.key,
      required this.onTap,
      required this.myButtonColor,
      required this.myButtonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: myButtonColor,
            border: Border.all(width: 1, color: Colors.grey)),
        child: Center(
          child: Text(
            myButtonText,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

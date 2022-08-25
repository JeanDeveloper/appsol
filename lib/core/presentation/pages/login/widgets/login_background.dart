import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  
  const LoginBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [

        Image.asset(
          'assets/jpgs/background-login.jpg',
          fit: BoxFit.cover,
        ),

        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.black26,
            ),
          ),
        ),

      ],
    );

  }

}
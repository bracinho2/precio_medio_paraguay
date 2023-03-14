import 'package:flutter/material.dart';

class BackgroundMapWidget extends StatelessWidget {
  const BackgroundMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.4,
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://images.unsplash.com/photo-1640282693834-f941c0c012aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MovieItemDesktop extends StatelessWidget {
  const MovieItemDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (context, index) {
        return null;
      },
    );
  }
}

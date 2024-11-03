import 'package:flutter/material.dart';
import 'package:movies/core/helpers/spacing.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backgroundColo,
      required this.text,
      required this.icon});
  final Color backgroundColo;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(Size(
              MediaQuery.sizeOf(context).width / 3.5,
              MediaQuery.sizeOf(context).width > 800 ? 60 : 40)),
          backgroundColor: WidgetStateProperty.all(backgroundColo),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            horizontalSpace(5),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.white),
            ),
          ],
        ));
  }
}

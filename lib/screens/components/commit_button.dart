import 'package:flutter/material.dart';

class CommitButton extends StatelessWidget {
  final String buttonName;
  final double width;
  final Function()? onTap;
  const CommitButton(
      {Key? key, required this.buttonName, required this.width, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 40,
        alignment: Alignment.center,
        child: Text(
          buttonName,
          style: TextStyle(
              color: Theme.of(context).backgroundColor,
              fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              blurRadius: 2,
              offset: const Offset(1, 3),
            )
          ],
        ),
      ),
    );
  }
}

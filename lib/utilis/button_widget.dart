import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant.dart';

class ReuseableButtons extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? textcolor;
  final void Function()? onTap;
  const ReuseableButtons({
    Key? key,
    required this.title,
    this.onTap,
    Color? color,
    Color? textcolor,
  })  : color = color ?? Colors.white,
        textcolor = textcolor ?? AppColors.primaryColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 280,
      height: 50,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      textColor: textcolor,
      onPressed: onTap,
      child: Text(
        title,
      ),
    );
  }
}

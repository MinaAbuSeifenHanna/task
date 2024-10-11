// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:task/Core/Extentions/extentions.dart';

import '../Themes/app_colors.dart';

class GenralAppbar extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const GenralAppbar({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        leadingWidth: 40,
        leading: DecoratedBox(
          decoration: BoxDecoration(

              color: AppColors.primary500,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
              ),

          ),
          child: IconButton(
            onPressed: onPressed,
            padding: const EdgeInsets.all(0),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ).setHorizontalPadding(context, 0.01),
      ),
    );
  }
}

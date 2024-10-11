import 'dart:ui';

import 'package:flutter/material.dart';

import '../Constants/asset_strings.dart';

class AppBackGround extends StatelessWidget {
  const AppBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(ImageStrings.mainBackGround),
          fit: BoxFit.fill,
          filterQuality: FilterQuality.low,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
        ),
      ),
    );
  }
}

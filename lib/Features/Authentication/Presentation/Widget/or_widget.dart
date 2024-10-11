import 'package:flutter/material.dart';

class ORWidget extends StatelessWidget {
  const ORWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // const Expanded(
        //   child: Divider(
        //     thickness: 0.5,
        //     color: Colors.white,
        //     height: 30,
        //   ),
        // ),
        // SizedBox(
        //   width: size.width * 0.05,
        // ),
        const Text(
          'Or',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        // SizedBox(
        //   width: size.width * 0.05,
        // ),
        // const Expanded(
        //   child: Divider(
        //     thickness: 0.5,
        //     color: Colors.white,
        //     height: 30,
        //   ),
        // ),
      ],
    );
  }
}

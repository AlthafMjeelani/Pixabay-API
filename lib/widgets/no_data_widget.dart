
import 'package:flutter/material.dart';
import 'package:kochitask/helper/app_spacing.dart';
import 'package:lottie/lottie.dart';

class CustomNotFoundWidget extends StatelessWidget {
  const CustomNotFoundWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        height: size.height * 0.45,
        width: size.width * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style:TextStyle(fontSize: 20) ,
              textAlign: TextAlign.center,
            ),
          
          ],
        ),
      ),
    );
  }
}

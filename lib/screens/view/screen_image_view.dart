import 'package:flutter/material.dart';

class ScreenImageView extends StatelessWidget {
  const ScreenImageView({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image View'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.fill
              ),
            ),
          ),
        ),
      ),
    );
  }
}

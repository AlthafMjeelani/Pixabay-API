import 'package:flutter/material.dart';
import 'package:kochitask/screens/controller/image_provider.dart';
import 'package:provider/provider.dart';

class Screenspash extends StatelessWidget {
  const Screenspash({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ImageController>(context, listen: false).gotoHome(context);
    return const Scaffold(
      body: Center(child: CircularProgressIndicator(),),
    );
  }
}
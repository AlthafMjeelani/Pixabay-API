import 'package:flutter/cupertino.dart';

class TextfeildWidget extends StatelessWidget {
  const TextfeildWidget({
    Key? key,
    this.onChanged,
    required this.text,
    this.controller,
    this.suffixIcon,
  }) : super(key: key);

  final String? Function(String?)? onChanged;
  final String text;
  final TextEditingController? controller;
  final Icon? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      controller: controller,
      placeholder: text,
      suffixIcon: suffixIcon!,
      autofocus: true,
      onChanged: onChanged,
    );
  }
}

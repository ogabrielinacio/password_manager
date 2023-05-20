import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  final String title;
  const FormTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height / 40,
        ),
      ),
    );
  }
}

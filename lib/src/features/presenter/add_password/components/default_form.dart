import 'package:flutter/material.dart';

class DefaultForm extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  const DefaultForm({
    super.key,
    required this.controller,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key:  formKey,
      child: TextFormField(
        controller: controller,
      ),
    );
  }
}

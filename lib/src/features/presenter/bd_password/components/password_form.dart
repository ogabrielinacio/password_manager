import 'package:flutter/material.dart';
import 'package:password_manager/src/shared/validation_mixins/validations_mixin.dart';

class PasswordForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
    final TextEditingController controller;
  const PasswordForm({super.key, required this.formKey, required this.controller});

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> with ValidationMixin {
  bool isObscureText = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return SizedBox(
                  height: sizeHeight * 0.18,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
                  height: sizeHeight * 0.16,
              child: Form(
                key: widget.formKey,
                child: SizedBox(
                  width: sizeWidth * 0.5,
                  height: sizeHeight * 0.12,
                  child: TextFormField(
                    obscureText: isObscureText,
                    controller: widget.controller, autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      hintText: 'senha',
                    ),
                    validator: (value) => combine([
                      () => isNotEmpty(value),
                      () => hasTwelveChars(value),
                    ]),
                    onFieldSubmitted: (value) {
                    },
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: sizeWidth * 0.18,
              child: Align(
            alignment: Alignment.topCenter,
                child: SizedBox(
                  width: sizeWidth * 0.18,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    child: Icon(
                      isObscureText ? Icons.remove_red_eye : Icons.lock_outline,
                      color: colorScheme.onSurface,
                      size: sizeWidth * 0.06,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

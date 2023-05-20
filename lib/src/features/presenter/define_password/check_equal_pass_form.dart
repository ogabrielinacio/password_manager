import 'package:flutter/material.dart';
import 'package:password_manager/src/features/presenter/define_password/form_title.dart';
import 'package:password_manager/src/shared/validation_mixins/validations_mixin.dart';

class CheckEqualPassWordForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final GlobalKey<FormState> confirmFormKey;
  final FocusNode focusNode;
  final GlobalKey<FormState>? currentPassformKey;
  final FocusNode? currentPassfocusNode;
  final String title;
  final bool changepass;
  final ScrollController scrollController;
  final TextEditingController controller;
  const CheckEqualPassWordForm({
    Key? key,
    required this.formKey,
    required this.confirmFormKey,
    required this.focusNode,
    required this.title,
    required this.controller,
    this.changepass = false,
    this.currentPassformKey,
    this.currentPassfocusNode,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<CheckEqualPassWordForm> createState() => _CheckEqualPassWordFormState();
}

class _CheckEqualPassWordFormState extends State<CheckEqualPassWordForm>
    with ValidationMixin {
  bool repeatIsObscureText = true;
  bool isObscureText = true;
  final passController = TextEditingController();
  final currentPassController = TextEditingController();
  final FocusNode confirmFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    void scrollList(double size) {
      widget.scrollController.animateTo(
        sizeHeight * size,
        curve: Curves.linear,
        duration: const Duration(milliseconds: 500),
      );
    }

    return Column(
      children: [
        Visibility(
          visible: widget.changepass,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Form(
                      key: widget.currentPassformKey,
                      child: SizedBox(
                        width: sizeWidth * 0.5,
                        height: sizeHeight * 0.12,
                        child: TextFormField(
                          obscureText: isObscureText,
                          focusNode: widget.currentPassfocusNode,
                          controller: currentPassController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                            hintText: 'senha',
                          ),
                          validator: (value) => combine([
                            () => isNotEmpty(value),
                            () => hasTwelveChars(value),
                          ]),
                          onFieldSubmitted: (value) {
                            if (widget.currentPassformKey!.currentState!
                                .validate()) {
                              FocusScope.of(context)
                                  .requestFocus(widget.focusNode);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: sizeWidth * 0.18,
                    height: sizeHeight * 0.12,
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
                            isObscureText
                                ? Icons.remove_red_eye
                                : Icons.lock_outline,
                            color: colorScheme.onSurface,
                            size: sizeWidth * 0.06,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: sizeWidth * 0.9,
                child: const FormTitle(
                  title: 'Digite a nova senha de configuração:',
                ),
              ),
              SizedBox(
                // height: 2.h,
                height: sizeHeight * 0.02,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Form(
                key: widget.formKey,
                child: SizedBox(
                  width: sizeWidth * 0.58,
                  height: sizeHeight * 0.15,
                  child: TextFormField(
                    controller: passController,
                    obscureText: repeatIsObscureText,
                    focusNode: widget.focusNode,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      hintText: 'senha',
                    ),
                    validator: (value) => combine([
                      () => isNotEmpty(value),
                      () => hasTwelveChars(value),
                      if (widget.changepass)
                        () => notEqualInputs(
                              value,
                              currentPassController.text,
                              'A nova senha não pode ser igual a antiga',
                            )
                    ]),
                    onFieldSubmitted: (value) {
                      if (widget.formKey.currentState!.validate()) {
                        FocusScope.of(context).requestFocus(confirmFocusNode);
                        if (widget.changepass) scrollList(0.2);
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              width: sizeWidth * 0.18,
              height: sizeHeight * 0.15,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: sizeWidth * 0.18,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        repeatIsObscureText = !repeatIsObscureText;
                      });
                    },
                    child: Icon(
                      repeatIsObscureText
                          ? Icons.remove_red_eye
                          : Icons.lock_outline,
                      color: colorScheme.onSurface,
                      size: sizeWidth * 0.06,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: sizeHeight * 0.05,
        ),
        SizedBox(
          width: sizeWidth * 0.9,
          child: FormTitle(
            title: widget.title,
          ),
        ),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Form(
                  key: widget.confirmFormKey,
                  child: SizedBox(
                    width: sizeWidth * 0.58,
                    height: sizeHeight * 0.15,
                    child: TextFormField(
                      controller: widget.controller,
                      obscureText: repeatIsObscureText,
                      focusNode: confirmFocusNode,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        hintText: 'repita  a senha',
                      ),
                      validator: (value) => combine([
                        () => isNotEmpty(value),
                        () => hasTwelveChars(value),
                        () => equalInputs(value, passController.text,
                            'As senha não são iguais'),
                      ]),
                      onFieldSubmitted: (value) {
                        if (widget.confirmFormKey.currentState!.validate()) {
                          if (widget.changepass) {
                            scrollList(0.4);
                          } else {
                            scrollList(0.2);
                          }
                        }
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: sizeWidth * 0.18,
                height: sizeHeight * 0.15,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: sizeWidth * 0.18,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          repeatIsObscureText = !repeatIsObscureText;
                        });
                      },
                      child: Icon(
                        repeatIsObscureText
                            ? Icons.remove_red_eye
                            : Icons.lock_outline,
                        color: colorScheme.onSurface,
                        size: sizeWidth * 0.06,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

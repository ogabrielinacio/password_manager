import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/src/features/bloc/mixins/initial_storage_mixin.dart';
import 'package:password_manager/src/features/bloc/storage_bloc.dart';
import 'package:password_manager/src/features/infra/adapters/storage_key.dart';
import 'package:password_manager/src/features/presenter/bd_password/components/password_form.dart';

class BDPassword extends StatefulWidget {
  const BDPassword({super.key});

  @override
  State<BDPassword> createState() => _BDPasswordState();
}

class _BDPasswordState extends State<BDPassword> {
  final _passkey = GlobalKey<FormState>();
  final TextEditingController _passController = TextEditingController();
  String btnString = 'Continuar';
  @override
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<InitialPasswordStorageMixin, StorageState>(
      builder: (context, state) {
        if (state is StorageStateReadAll) {
          StorageKey  element = state.data.first;
          return SingleChildScrollView(
            child: Container(
              color: colorScheme.background,
              height: sizeHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Digite a senha para entrar no banco',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: sizeHeight * 0.035),
                  ),
                  SizedBox(height: sizeHeight * 0.1),
                  PasswordForm(formKey: _passkey, controller: _passController),
                  SizedBox(
                    height: sizeHeight * 0.08,
                    width: sizeWidth * 0.8,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_passkey.currentState!.validate()) {
                          if (_passController.text == element.storageKey ) {
                            Navigator.pushNamed(context, '/passwordList');
                            _passController.text = '';
                            //TODO: close keyboard
                          } else {
                            setState(() {
                              btnString = 'Senha Inválida';
                            });
                          }
                        }
                      },
                      child: Text(
                        btnString,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: colorScheme.onSurface,
                            fontSize: sizeHeight * 0.023),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizeHeight * 0.1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/env/env.dart';
import 'package:password_manager/src/features/bloc/mixins/initial_storage_mixin.dart';
import 'package:password_manager/src/features/bloc/mixins/password_manager_mixin.dart';
import 'package:password_manager/src/features/bloc/storage_bloc.dart';
import 'package:password_manager/src/features/infra/adapters/storage_key.dart';
import 'package:password_manager/src/shared/components/check_equal_pass_form.dart';
import 'package:password_manager/src/shared/validation_mixins/validations_mixin.dart';

class DefinePassword extends StatefulWidget {
  const DefinePassword({super.key});
  @override
  State<DefinePassword> createState() => _DefinePasswordState();
}

class _DefinePasswordState extends State<DefinePassword> with ValidationMixin {
  final _passkey = GlobalKey<FormState>();
  final _confirmPasskey = GlobalKey<FormState>();
  final FocusNode _passFocusNode = FocusNode();
  final TextEditingController _passController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: colorScheme.background,
        height: sizeHeight,
        child: Padding(
          padding: EdgeInsets.only(
            right: sizeWidth * 0.1,
            left: sizeWidth * 0.1,
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height:  sizeHeight * 0.1,),
                Text(
                  'Crie uma senha para entrar no banco:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: colorScheme.onSurfaceVariant,
                      fontSize: sizeHeight * 0.035),
                ),
                SizedBox(
                  height: sizeHeight * 0.1,
                ),
                CheckEqualPassWordForm(
                  formKey: _passkey,
                  confirmFormKey: _confirmPasskey,
                  focusNode: _passFocusNode,
                  controller: _passController,
                  title: 'Repita a senha de configuração:',
                  scrollController: scrollController,
                ),
                SizedBox(
                  height: sizeHeight * 0.08,
                  width: sizeWidth * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                        var data =    StorageKey(
                          storageKey: 
                          _passController.text,
                        );
                      BlocProvider.of<InitialPasswordStorageMixin>(context).add(
                        StorageEventWrite(
                          data: data,
                        ),
                      );
                      BlocProvider.of<PasswordManagerMixin>(context).add(
                          StorageEventInitial(
                              dbName: 'PasswordManager',
                              dbkey: Env.storageKey2));
                      Navigator.pushNamed(context, '/splash');
                    },
                    child: Text(
                      'Continuar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: colorScheme.onSurface,
                          fontSize: sizeHeight * 0.023),
                    ),
                  ),
                ),
                SizedBox(height:  sizeHeight * 0.1,),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/src/features/bloc/mixins/password_manager_mixin.dart';
import 'package:password_manager/src/features/bloc/storage_bloc.dart';
import 'package:password_manager/src/features/infra/adapters/entry.dart';
import 'package:password_manager/src/features/presenter/add_password/components/default_form.dart';
import 'package:password_manager/src/shared/components/form_title.dart';

class AddPassword extends StatefulWidget {
  const AddPassword({super.key});

  @override
  State<AddPassword> createState() => _AddPasswordState();
}

class _AddPasswordState extends State<AddPassword> {
  final _titleKey = GlobalKey<FormState>();
  final _usernameKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormState>();
  final _urlKey = GlobalKey<FormState>();
  final FocusNode _userameFocusNode = FocusNode();
  final FocusNode _passFocusNode = FocusNode();
  final FocusNode _urlFocusNode = FocusNode();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    Widget customSpacing = SizedBox(height: sizeHeight * 0.02,);
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        title: Text(
          'Adicionar Senha',
          style: TextStyle(fontSize: sizeHeight * 0.04),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: sizeWidth * 0.1,
            left: sizeWidth * 0.1,
          ),
          child: Column(
            children: [
              SizedBox(height: sizeHeight * 0.04,),
              const Align( alignment: Alignment.topLeft, child: FormTitle(title: "Título:")),
              DefaultForm(
                controller: _titleController,
                formKey: _titleKey,
              ),
              customSpacing,
              const Align( alignment: Alignment.topLeft, child: FormTitle(title: "Username:")),
              DefaultForm(
                controller: _usernameController,
                formKey: _usernameKey,
              ),
              customSpacing,
              const Align( alignment: Alignment.topLeft, child: FormTitle(title: "Senha:")),
              DefaultForm(
                controller: _passController,
                formKey: _passKey,
              ),
              customSpacing,
              const Align( alignment: Alignment.topLeft, child: FormTitle(title: "Url(Opcional):")),
              DefaultForm(
                controller: _urlController,
                formKey: _urlKey,
              ),
              SizedBox(height: sizeHeight * 0.1),
              SizedBox(
                height: sizeHeight * 0.08,
                width: sizeWidth * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    var entryData = Entry(
                      title: _titleController.text,
                      username: _usernameController.text,
                      password: _passController.text,
                    );
                    BlocProvider.of<PasswordManagerMixin>(context).add(
                      StorageEventWrite(data: entryData),
                    );
                      Navigator.pushNamed(context, '/passwordList');
                  },
                  child: Text(
                    'Salvar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: colorScheme.onSurface,
                        fontSize: sizeHeight * 0.023),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

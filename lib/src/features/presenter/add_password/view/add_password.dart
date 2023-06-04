import 'package:flutter/material.dart';
import 'package:password_manager/src/shared/components/check_equal_pass_form.dart';
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
              const FormTitle(title: "Título:"),
              const FormTitle(title: "Username:"),
              const FormTitle(title: "Senha:"),
              const FormTitle(title: "Url:(Opcional)"),
              SizedBox(height: sizeHeight * 0.1),
              SizedBox(
                height: sizeHeight * 0.08,
                width: sizeWidth * 0.8,
                child: ElevatedButton(
                  onPressed: () {

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

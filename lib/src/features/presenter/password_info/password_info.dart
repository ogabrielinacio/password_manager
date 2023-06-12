import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/src/features/bloc/mixins/password_manager_mixin.dart';
import 'package:password_manager/src/features/bloc/storage_bloc.dart';
import 'package:password_manager/src/features/infra/adapters/entry.dart';
import 'package:password_manager/src/features/presenter/password_info/components/item_copy.dart';

class PasswordInfo extends StatelessWidget {
  const PasswordInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    Entry data = arguments['pass'];
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        title: Text(
          'Info Senhas',
          style: TextStyle(fontSize: sizeHeight * 0.04),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.black,
              ),
              onPressed: () {
                BlocProvider.of<PasswordManagerMixin>(context)
                    .add(StorageEventDelete(key: data.title));
                      Navigator.pushNamedAndRemoveUntil(context,'/splash', (route) => false);
              },
            ),
          ),
          ItemCopy(text: data.title),
          ItemCopy(text: data.username),
          ItemCopy(text: data.password),
          (data.url != null) ? 
          ItemCopy(text: data.url!) 
          : const SizedBox(),
        ],
      ),
    );
  }
}

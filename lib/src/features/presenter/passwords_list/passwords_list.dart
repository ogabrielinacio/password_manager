import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:password_manager/src/features/bloc/mixins/password_manager_mixin.dart';
import 'package:password_manager/src/features/bloc/storage_bloc.dart';
import 'package:password_manager/src/features/infra/adapters/entry.dart';

class PasswordList extends StatefulWidget {
  const PasswordList({super.key});

  @override
  State<PasswordList> createState() => _PasswordListState();
}

class _PasswordListState extends State<PasswordList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PasswordManagerMixin>(context).add(StorageEventReadAll());
  }

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
          'Suas Senhas',
          style: TextStyle(fontSize: sizeHeight * 0.04),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              // size: ,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/addPassword');
            },
          ),
        ],
      ),
      body: BlocBuilder<PasswordManagerMixin, StorageState>(
        builder: (context, state) {
          debugPrint("state is $state");
          if (state is StorageStateReadAll) {
            List data = state.data;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.list),
                    trailing: IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: () async {
                        await Clipboard.setData(
                          ClipboardData(text: data[index].password),
                        );
                      },
                    ),
                    title: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/PasswordInfo',
                            arguments: {'pass': data[index]});
                      },
                      child: Text(
                        "${data[index].title}",
                      ),
                    ),
                  );
                });
          } else if (state is StorageStateEmptyList) {
            return Padding(
              padding: EdgeInsets.only(
                right: sizeWidth * 0.1,
                left: sizeWidth * 0.1,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Não há senhas registradas.',
                    style: TextStyle(
                      fontSize: sizeHeight * 0.03,
                    ),
                  ),
                  SizedBox(
                    height: sizeHeight * 0.1,
                  ),
                  SizedBox(
                    height: sizeHeight * 0.08,
                    width: sizeWidth * 0.8,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/addPassword');
                      },
                      child: Text(
                        'Adicionar',
                        style: TextStyle(
                          fontSize: sizeHeight * 0.03,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: SpinKitDoubleBounce(
                color: colorScheme.primary,
                size: sizeHeight * 0.35,
              ),
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:password_manager/src/features/bloc/mixins/initial_storage_mixin.dart';
import 'package:password_manager/src/features/bloc/storage_bloc.dart';
import 'package:password_manager/src/features/presenter/bd_password/view/bd_password.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<InitialPasswordStorageMixin>(context)
        .add(StorageEventReadAll());
  }

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
        child: Padding(
          padding: EdgeInsets.only(
            right: sizeWidth * 0.1,
            left: sizeWidth * 0.1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<InitialPasswordStorageMixin, StorageState>(
                builder: (context, state) {
                  if (state is StorageStateReadAll) {
                    return const BDPassword();
                  } else if (state is StorageStateEmptyList) {
                    return Column(
                      children: [
                        Text(
                          'Você não possui senhas armazenadas',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: colorScheme.onSurfaceVariant,
                              fontSize: sizeHeight * 0.035),
                        ),
                        SizedBox(height: sizeHeight * 0.1),
                        SizedBox(
                          height: sizeHeight * 0.08,
                          width: sizeWidth * 0.8,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/definePassword');
                            },
                            child: Text(
                              'Adicionar',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: colorScheme.onSurface,
                                  fontSize: sizeHeight * 0.023),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is StorageStateFailure) {
                    return Column(
                      children: [
                        Text(
                          'Ocorreu um erro inesperado',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: colorScheme.onSurface,
                              fontSize: sizeHeight * 0.023),
                        ),
                      ],
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
            ],
          ),
        ),
      ),
    );
  }
}

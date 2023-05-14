import 'package:flutter/material.dart';
import 'package:password_manager/src/features/bloc/mixins/initial_storage_mixin.dart';
import 'package:password_manager/src/features/bloc/mixins/password_manager_mixin.dart';
import 'package:password_manager/src/features/bloc/storage_bloc.dart';
import 'package:password_manager/src/features/presenter/lock_screen/lock_screen.dart';
import 'package:password_manager/src/components/splash_screen.dart';

import 'package:password_manager/src/shared/themes/themes.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InitialPasswordStorageMixin>(create: (BuildContext context) => StorageBloc()),
        BlocProvider<PasswordManagerMixin>(create: (BuildContext context) => StorageBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: lightTheme,
        darkTheme: lightTheme,
        initialRoute: '/splash',
        routes: {
          '/splash': (_) => const SplashScreenView(),
          '/lock': (_) => const LockScreen(),
        },
      ),
    );
  }
}
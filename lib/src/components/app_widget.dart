import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/src/features/bloc/storage_bloc.dart';
import 'package:password_manager/src/features/presenter/home/home_screen.dart';
import 'package:password_manager/src/shared/themes/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => StorageBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: lightTheme,
        darkTheme: lightTheme,
        initialRoute: '/splash',
        routes: {
          '/': (_) =>  const HomeScreen(),
        },
      ),
    );
  }
}

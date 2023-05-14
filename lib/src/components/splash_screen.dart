import 'package:flutter/material.dart';

import 'package:password_manager/env/env.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:password_manager/src/features/bloc/mixins/initial_storage_mixin.dart';
import 'package:password_manager/src/features/bloc/storage_bloc.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<InitialPasswordStorageMixin>(context).add(
        StorageEventInitial(
            dbName: 'InitialPasswordStorage', dbkey: Env.storageKey1));
    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.pushNamed(context, '/lock');
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    // double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;

    return Container(
      color: colorScheme.background,
      child: Center(
        child: SpinKitDoubleBounce(
          color: colorScheme.primary,
          size: sizeHeight * 0.35,
        ),
      ),
    );
  }
}

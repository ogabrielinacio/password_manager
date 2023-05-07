import 'package:flutter/material.dart';

part 'color_schemes.g.dart';

ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _lightColorScheme,
      fontFamily: 'Arimo',
      primaryColor: _lightColorScheme.primary,
      appBarTheme: AppBarTheme(
        foregroundColor: _lightColorScheme.onSurface,
        backgroundColor: _lightColorScheme.primary,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: _lightColorScheme.onSurface,
          fontSize: 28,
        ),
        iconTheme: IconThemeData(
          color: _lightColorScheme.onSurface,
          size: 28,
        ),
        actionsIconTheme: IconThemeData(
          color: _lightColorScheme.onSurface,
          size: 28,
        ),
      ),
      iconTheme: IconThemeData(
        color: _lightColorScheme.onSurface,
        size: 28,
      ),
      primaryIconTheme: IconThemeData(
        color: _lightColorScheme.onSurface,
        size: 28,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: _lightColorScheme.onSurface,
          backgroundColor: _lightColorScheme.primary,
          elevation: 20,
          shadowColor: _lightColorScheme.shadow,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: _lightColorScheme.outline,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(40),
          ),
          textStyle: TextStyle(
            color: _lightColorScheme.onSurface,
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _lightColorScheme.secondary,
        foregroundColor: _lightColorScheme.onSurfaceVariant,
        elevation: 20,
        iconSize: 34,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
        ),
      ),
      cardTheme: CardTheme(
        surfaceTintColor: _lightColorScheme.background,
        elevation: 30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorMaxLines: 2,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(25.0),
          ),
          borderSide: BorderSide(
            color: _lightColorScheme.outline,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(25.0),
          ),
          borderSide: BorderSide(
            color: _lightColorScheme.outline,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(25.0),
          ),
          borderSide: BorderSide(
            color: _lightColorScheme.error,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(25.0),
          ),
          borderSide: BorderSide(
            color: _lightColorScheme.error,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        errorStyle: const TextStyle(
          fontSize: 16,
        ),
      ),
    );

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/home_page/home_page.dart';
import 'presentation/settings_page/settings_cubit.dart';

class CoolChatJournalApp extends StatefulWidget {
  final User? user;

  const CoolChatJournalApp({
    super.key,
    required this.user,
  });

  @override
  State<CoolChatJournalApp> createState() => _CoolChatJournalAppState();
}

class _CoolChatJournalAppState extends State<CoolChatJournalApp> {
  
  TextTheme _generateTextTheme(BuildContext context) {
    final fontSizeType = context.read<SettingsCubit>().state.fontSizeType;

    final double defaultSize;
    switch (fontSizeType) {
      case FontSizeType.small:
        defaultSize = 14.0;
        break;
      case FontSizeType.medium:
        defaultSize = 16.0;
        break;
      case FontSizeType.large:
        defaultSize = 22.0;
        break;
    }

    return TextTheme(
      displayLarge: TextStyle(fontSize: defaultSize),
      displayMedium: TextStyle(fontSize: defaultSize),
      displaySmall: TextStyle(fontSize: defaultSize),
      headlineLarge: TextStyle(fontSize: defaultSize),
      headlineMedium: TextStyle(fontSize: defaultSize),
      headlineSmall: TextStyle(fontSize: defaultSize),
      titleLarge: TextStyle(fontSize: defaultSize),
      titleMedium: TextStyle(fontSize: defaultSize),
      titleSmall: TextStyle(fontSize: defaultSize),
      bodyLarge: TextStyle(fontSize: defaultSize),
      bodyMedium: TextStyle(fontSize: defaultSize),
      bodySmall: TextStyle(fontSize: defaultSize),
      labelLarge: TextStyle(fontSize: defaultSize),
      labelMedium: TextStyle(fontSize: defaultSize),
      labelSmall: TextStyle(fontSize: defaultSize),
    );
  }
  
  ThemeData _generateTheme(BuildContext context) {
    final themeKey = context.read<SettingsCubit>().state.themeType;

    switch (themeKey) {
      case ThemeType.light:
        return FlexThemeData.light(
          useMaterial3: true,
          surface: const Color(0xffff7373),
          scheme: FlexScheme.mandyRed,
          textTheme: _generateTextTheme(context),
        );
      case ThemeType.dark:
        return FlexThemeData.dark(
          useMaterial3: true,
          scheme: FlexScheme.mandyRed,
          textTheme: _generateTextTheme(context),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit(user: widget.user),
      child: Builder(builder: (context) {
        return BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Cool Chat Journal',
              theme: _generateTheme(context),
              home: HomePage(user: widget.user),
            );
          },
        );
      }),
    );
  }
}

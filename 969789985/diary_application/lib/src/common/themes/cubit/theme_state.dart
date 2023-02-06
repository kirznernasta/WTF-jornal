part of 'theme_cubit.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    required bool isDarkMode,
  }) = _ThemeState;
}
import 'package:flutter/material.dart';

// ── AppColors ────────────────────────────────────────────────────────────────

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.primary,
    required this.success,
    required this.error,
    required this.warning,
  });

  final Color primary;
  final Color success;
  final Color error;
  final Color warning;

  static const dark = AppColors(
    primary: Color(0xFF8032DA),
    success: Color(0xFF23E01D),
    error: Color(0xFFE02C11),
    warning: Color(0xFFDAB632),
  );

  static const light = AppColors(
    primary: Color(0xFF8032DA),
    success: Color(0xFF23E01D),
    error: Color(0xFFE02C11),
    warning: Color(0xFFDAB632),
  );

  @override
  AppColors copyWith({
    Color? primary,
    Color? success,
    Color? error,
    Color? warning,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      success: success ?? this.success,
      error: error ?? this.error,
      warning: warning ?? this.warning,
    );
  }

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      success: Color.lerp(success, other.success, t)!,
      error: Color.lerp(error, other.error, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
    );
  }
}

extension AppColorsX on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}

// ── AppRadii ─────────────────────────────────────────────────────────────────

class AppRadii extends ThemeExtension<AppRadii> {
  const AppRadii({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.full,
  });

  final BorderRadius xs;
  final BorderRadius sm;
  final BorderRadius md;
  final BorderRadius lg;
  final BorderRadius xl;
  final BorderRadius full;

  static final defaults = AppRadii(
    xs: BorderRadius.circular(4),
    sm: BorderRadius.circular(8),
    md: BorderRadius.circular(12),
    lg: BorderRadius.circular(16),
    xl: BorderRadius.circular(24),
    full: BorderRadius.circular(999),
  );

  @override
  AppRadii copyWith({
    BorderRadius? xs,
    BorderRadius? sm,
    BorderRadius? md,
    BorderRadius? lg,
    BorderRadius? xl,
    BorderRadius? full,
  }) {
    return AppRadii(
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      full: full ?? this.full,
    );
  }

  @override
  AppRadii lerp(AppRadii? other, double t) {
    if (other is! AppRadii) return this;
    return AppRadii(
      xs: BorderRadius.lerp(xs, other.xs, t)!,
      sm: BorderRadius.lerp(sm, other.sm, t)!,
      md: BorderRadius.lerp(md, other.md, t)!,
      lg: BorderRadius.lerp(lg, other.lg, t)!,
      xl: BorderRadius.lerp(xl, other.xl, t)!,
      full: BorderRadius.lerp(full, other.full, t)!,
    );
  }
}

extension AppRadiiX on BuildContext {
  AppRadii get appRadii => Theme.of(this).extension<AppRadii>()!;
}

// ── AppTheme ──────────────────────────────────────────────────────────────────

class AppTheme {
  AppTheme._();

  static ThemeData theme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final appColors = isDark ? AppColors.dark : AppColors.light;
    final radii = AppRadii.defaults;

    final colorScheme = ColorScheme.fromSeed(
      seedColor: appColors.primary,
      brightness: brightness,
      error: appColors.error,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      fontFamily: 'Rubik',
      shadowColor: Colors.transparent,
      extensions: [appColors, radii],
      appBarTheme: const AppBarTheme(
        elevation: 0,
        shadowColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      cardTheme: const CardThemeData(
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      dialogTheme: const DialogThemeData(elevation: 0),
      bottomSheetTheme: const BottomSheetThemeData(elevation: 0),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: radii.sm,
          ),
        ),
      ),
    );
  }
}

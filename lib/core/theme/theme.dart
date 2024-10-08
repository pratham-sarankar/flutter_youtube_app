import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xffa50001),
      surfaceTint: Color(0xffc00001),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffeb0002),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffb72115),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffff6f5c),
      onSecondaryContainer: Color(0xff280000),
      tertiary: Color(0xff704800),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa16900),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Colors.white,
      onSurface: Color(0xff2b1613),
      onSurfaceVariant: Color(0xff603e39),
      outline: Color(0xff956d67),
      outlineVariant: Color(0xffebbbb4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff422a27),
      inversePrimary: Color(0xffffb4a8),
      primaryFixed: Color(0xffffdad4),
      onPrimaryFixed: Color(0xff410000),
      primaryFixedDim: Color(0xffffb4a8),
      onPrimaryFixedVariant: Color(0xff930001),
      secondaryFixed: Color(0xffffdad4),
      onSecondaryFixed: Color(0xff410000),
      secondaryFixedDim: Color(0xffffb4a8),
      onSecondaryFixedVariant: Color(0xff930001),
      tertiaryFixed: Color(0xffffddb5),
      onTertiaryFixed: Color(0xff2a1800),
      tertiaryFixedDim: Color(0xffffb956),
      onTertiaryFixedVariant: Color(0xff643f00),
      surfaceDim: Color(0xfff8d1cb),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ee),
      surfaceContainer: Color(0xffffe9e6),
      surfaceContainerHigh: Color(0xffffe2dd),
      surfaceContainerHighest: Color(0xffffdad4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff8c0000),
      surfaceTint: Color(0xffc00001),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffeb0002),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff8c0000),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd73929),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff5e3b00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa16900),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff2b1613),
      onSurfaceVariant: Color(0xff5b3a35),
      outline: Color(0xff7b5650),
      outlineVariant: Color(0xff99716b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff422a27),
      inversePrimary: Color(0xffffb4a8),
      primaryFixed: Color(0xffeb0002),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xffbc0001),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xffd73929),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xffb41e13),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffa16900),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff805200),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xfff8d1cb),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ee),
      surfaceContainer: Color(0xffffe9e6),
      surfaceContainerHigh: Color(0xffffe2dd),
      surfaceContainerHighest: Color(0xffffdad4),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4e0000),
      surfaceTint: Color(0xffc00001),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff8c0000),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4e0000),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff8c0000),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff331e00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5e3b00),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff381c18),
      outline: Color(0xff5b3a35),
      outlineVariant: Color(0xff5b3a35),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff422a27),
      inversePrimary: Color(0xffffe7e3),
      primaryFixed: Color(0xff8c0000),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff620000),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff8c0000),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff620000),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5e3b00),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff412700),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xfff8d1cb),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ee),
      surfaceContainer: Color(0xffffe9e6),
      surfaceContainerHigh: Color(0xffffe2dd),
      surfaceContainerHighest: Color(0xffffdad4),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb4a8),
      surfaceTint: Color(0xffffb4a8),
      onPrimary: Color(0xff690000),
      primaryContainer: Color(0xffeb0002),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffffb4a8),
      onSecondary: Color(0xff690000),
      secondaryContainer: Color(0xff860000),
      onSecondaryContainer: Color(0xffffc8c0),
      tertiary: Color(0xffffb956),
      onTertiary: Color(0xff462b00),
      tertiaryContainer: Color(0xffa16900),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff210e0b),
      onSurface: Color(0xffffdad4),
      onSurfaceVariant: Color(0xffebbbb4),
      outline: Color(0xffb18780),
      outlineVariant: Color(0xff603e39),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffffdad4),
      inversePrimary: Color(0xffc00001),
      primaryFixed: Color(0xffffdad4),
      onPrimaryFixed: Color(0xff410000),
      primaryFixedDim: Color(0xffffb4a8),
      onPrimaryFixedVariant: Color(0xff930001),
      secondaryFixed: Color(0xffffdad4),
      onSecondaryFixed: Color(0xff410000),
      secondaryFixedDim: Color(0xffffb4a8),
      onSecondaryFixedVariant: Color(0xff930001),
      tertiaryFixed: Color(0xffffddb5),
      onTertiaryFixed: Color(0xff2a1800),
      tertiaryFixedDim: Color(0xffffb956),
      onTertiaryFixedVariant: Color(0xff643f00),
      surfaceDim: Color(0xff210e0b),
      surfaceBright: Color(0xff4c332f),
      surfaceContainerLowest: Color(0xff1b0907),
      surfaceContainerLow: Color(0xff2b1613),
      surfaceContainer: Color(0xff2f1a17),
      surfaceContainerHigh: Color(0xff3b2420),
      surfaceContainerHighest: Color(0xff472f2b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffbaaf),
      surfaceTint: Color(0xffffb4a8),
      onPrimary: Color(0xff370000),
      primaryContainer: Color(0xffff5541),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffbaaf),
      onSecondary: Color(0xff370000),
      secondaryContainer: Color(0xffff5542),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffbf67),
      onTertiary: Color(0xff231300),
      tertiaryContainer: Color(0xffc4831a),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff210e0b),
      onSurface: Color(0xfffff9f8),
      onSurfaceVariant: Color(0xfff0c0b8),
      outline: Color(0xffc59891),
      outlineVariant: Color(0xffa27973),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffffdad4),
      inversePrimary: Color(0xff960001),
      primaryFixed: Color(0xffffdad4),
      onPrimaryFixed: Color(0xff2d0000),
      primaryFixedDim: Color(0xffffb4a8),
      onPrimaryFixedVariant: Color(0xff740000),
      secondaryFixed: Color(0xffffdad4),
      onSecondaryFixed: Color(0xff2d0000),
      secondaryFixedDim: Color(0xffffb4a8),
      onSecondaryFixedVariant: Color(0xff740000),
      tertiaryFixed: Color(0xffffddb5),
      onTertiaryFixed: Color(0xff1c0e00),
      tertiaryFixedDim: Color(0xffffb956),
      onTertiaryFixedVariant: Color(0xff4d3000),
      surfaceDim: Color(0xff210e0b),
      surfaceBright: Color(0xff4c332f),
      surfaceContainerLowest: Color(0xff1b0907),
      surfaceContainerLow: Color(0xff2b1613),
      surfaceContainer: Color(0xff2f1a17),
      surfaceContainerHigh: Color(0xff3b2420),
      surfaceContainerHighest: Color(0xff472f2b),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9f8),
      surfaceTint: Color(0xffffb4a8),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffbaaf),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9f8),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffbaaf),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffffaf7),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffbf67),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff210e0b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffff9f8),
      outline: Color(0xfff0c0b8),
      outlineVariant: Color(0xfff0c0b8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffffdad4),
      inversePrimary: Color(0xff5d0000),
      primaryFixed: Color(0xffffe0db),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffbaaf),
      onPrimaryFixedVariant: Color(0xff370000),
      secondaryFixed: Color(0xffffe0db),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffbaaf),
      onSecondaryFixedVariant: Color(0xff370000),
      tertiaryFixed: Color(0xffffe2c1),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffbf67),
      onTertiaryFixedVariant: Color(0xff231300),
      surfaceDim: Color(0xff210e0b),
      surfaceBright: Color(0xff4c332f),
      surfaceContainerLowest: Color(0xff1b0907),
      surfaceContainerLow: Color(0xff2b1613),
      surfaceContainer: Color(0xff2f1a17),
      surfaceContainerHigh: Color(0xff3b2420),
      surfaceContainerHighest: Color(0xff472f2b),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          backgroundColor: colorScheme.surface,
          selectedItemColor: colorScheme.onSurface,
          unselectedItemColor: colorScheme.onSurfaceVariant,
          type: BottomNavigationBarType.fixed,
          enableFeedback: true,
          selectedLabelStyle: textTheme.bodyLarge!.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          unselectedLabelStyle: textTheme.bodyLarge!.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontSize: 14,
          ),
        ),
        appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(
            color: colorScheme.onSurface,
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            backgroundColor: colorScheme.onSurface.withOpacity(0.1),
            foregroundColor: colorScheme.onSurface,
            padding: const EdgeInsets.all(10),
            iconSize: 24,
          ),
        ),
        chipTheme: ChipThemeData(
          selectedColor: colorScheme.onSurface,
          backgroundColor: colorScheme.surface,
          labelStyle: textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          showCheckmark: false,
          secondaryLabelStyle: textTheme.bodyLarge?.copyWith(
            color: colorScheme.surfaceBright,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          // shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
        ),
      );
}

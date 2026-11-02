import 'package:flclashx/common/common.dart';
import 'package:flutter/material.dart';

class CommonTheme {

  CommonTheme.of(
    this.context,
    this.textScaleFactor,
  ) : _colorMap = {};
  final BuildContext context;
  final Map<String, Color> _colorMap;
  final double textScaleFactor;

  Color get darkenSecondaryContainer => _colorMap.updateCacheValue(
        "darkenSecondaryContainer",
        () => context.colorScheme.secondaryContainer
            .blendDarken(context, factor: 0.1),
      )!;

  Color get darkenSecondaryContainerLighter => _colorMap.updateCacheValue(
        "darkenSecondaryContainerLighter",
        () => context.colorScheme.secondaryContainer
            .blendDarken(context, factor: 0.1)
            .opacity60,
      )!;

  Color get darken2SecondaryContainer => _colorMap.updateCacheValue(
        "darken2SecondaryContainer",
        () => context.colorScheme.secondaryContainer
            .blendDarken(context, factor: 0.2),
      )!;

  Color get darken3PrimaryContainer => _colorMap.updateCacheValue(
        "darken3PrimaryContainer",
        () => context.colorScheme.primaryContainer
            .blendDarken(context, factor: 0.3),
      )!;
}


/// Late-2025 Material 3 defaults layered on top of the app ThemeData: tonal
/// surfaces, consistent corner radii and the newer component shapes. Applied
/// after the base ThemeData so it composes with, not replaces, the color
/// scheme work.
extension M3ThemeDefaults on ThemeData {
  ThemeData applyM3Defaults() {
    final scheme = colorScheme;
    return copyWith(
      // M3 Expressive list/card language: medium corner radius, tonal
      // elevation-free surfaces.
      cardTheme: CardThemeData(
        color: scheme.surfaceContainerLow,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surfaceContainerHigh,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      tabBarTheme: TabBarThemeData(
        dividerColor: scheme.surfaceContainerHighest,
        labelColor: scheme.primary,
        unselectedLabelColor: scheme.onSurfaceVariant,
        indicatorColor: scheme.primary,
      ),
      chipTheme: chipTheme.copyWith(
        backgroundColor: scheme.surfaceContainerHigh,
        selectedColor: scheme.secondaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: textTheme.labelLarge?.copyWith(
          color: scheme.onSurfaceVariant,
        ),
      ),
      navigationBarTheme: navigationBarTheme.copyWith(
        backgroundColor: scheme.surfaceContainer,
        indicatorColor: scheme.secondaryContainer,
        height: 72,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumFigtreePrimary =>
      theme.textTheme.bodyMedium!.figtree.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );
  static get bodyMediumLato => theme.textTheme.bodyMedium!.lato;
  static get bodySmallLatoOrangeA700 =>
      theme.textTheme.bodySmall!.lato.copyWith(
        color: appTheme.orangeA700,
        fontSize: 10.fSize,
      );
  static get bodySmallLatoSecondaryContainer =>
      theme.textTheme.bodySmall!.lato.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontSize: 10.fSize,
      );
  // Headline text style
  static get headlineSmallMontserrat =>
      theme.textTheme.headlineSmall!.montserrat.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get headlineSmallOnPrimary => theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  // Label text style
  static get labelLargeFigtreeBluegray900 =>
      theme.textTheme.labelLarge!.figtree.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeFigtreeOnPrimary =>
      theme.textTheme.labelLarge!.figtree.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      );
  // Title text style
  static get titleMediumOrange900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.orange900,
        fontSize: 18.fSize,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );
  static get titleSmallInterWhiteA700 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallLatoPrimaryContainer =>
      theme.textTheme.titleSmall!.lato.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallLatoWhiteA700 =>
      theme.textTheme.titleSmall!.lato.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallSecondaryContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.secondaryContainer,
      );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
      );
}

extension on TextStyle {
  TextStyle get lato {
    return copyWith(
      fontFamily: 'Lato',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get figtree {
    return copyWith(
      fontFamily: 'Figtree',
    );
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }
}

import 'package:flutter/widgets.dart';

enum DeviceType { mobile, tablet, desktop }

class Breakpoints {
  Breakpoints._();

  static const double tablet = 720;
  static const double desktop = 1120;
  static const double maxContentWidth = 1180;

  static DeviceType deviceTypeOf(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= desktop) return DeviceType.desktop;
    if (width >= tablet) return DeviceType.tablet;
    return DeviceType.mobile;
  }

  static bool isMobile(BuildContext context) =>
      deviceTypeOf(context) == DeviceType.mobile;

  static bool isTablet(BuildContext context) =>
      deviceTypeOf(context) == DeviceType.tablet;

  static bool isDesktop(BuildContext context) =>
      deviceTypeOf(context) == DeviceType.desktop;

  /// Horizontal page padding that scales down gracefully on small screens.
  static double horizontalPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= desktop) return (width - maxContentWidth) / 2;
    if (width >= tablet) return 48;
    return 20;
  }
}

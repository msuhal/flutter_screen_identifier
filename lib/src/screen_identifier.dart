library screen_identifier;

/// ScreenIdentifier is a class that helps you to set value based on screen size condition or parent
/// widget size according to the width set in each classes
class ScreenIdentifier {
  /// width of screen size
  late double width;

  /// minimum width for extra extra extra large screen class
  double _xxxl = 1800;

  /// minimum width for extra extra large screen class
  double _xxl = 1400;

  /// minimum width for extra large screen class
  double _xl = 1200;

  /// minimum width for large screen class
  double _lg = 992;

  /// minimum width for medium screen class
  double _md = 768;

  /// minimum width for small screen class
  double _sm = 576;

  static ScreenIdentifier get instance => _instance;
  static final ScreenIdentifier _instance = ScreenIdentifier();

  static ScreenIdentifier init(double screenWidth) {
    return _instance..width = screenWidth;
  }

  /// customize default minimum width value in each screen size classes
  ///
  /// [xxxl] set minimum width for extra extra extra large screen class,
  /// [xxl] set minimum width for extra extra large screen class,
  /// [lg] set minimum width for extra large screen class,
  /// [md] set minimum width for medium screen class,
  /// [sm] set minimum width for small screen class,
  void setMinimalWidth({
    required double xxxl,
    required double xxl,
    required double xl,
    required double lg,
    required double md,
    required double sm,
  }) {
    _xxxl = xxxl;
    _xxl = xxl;
    _xl = xl;
    _lg = lg;
    _md = md;
    _sm = sm;
  }

  /// set value based on screen size condition or parent widget size
  /// according to the width set in each classes
  ///
  /// [xxxl] value for extra extra extra large screen class,
  /// [xxl] value for extra extra large screen class,
  /// [lg] value for extra large screen class,
  /// [md] value for medium screen class,
  /// [sm] value for small screen class,
  T conditions<T>({
    T? xxxl,
    T? xxl,
    T? xl,
    T? lg,
    T? md,
    T? sm,
    T? xs,
  }) {
    // Checking if at least one of the values is not null.
    assert(
      (xxxl ?? xxl ?? xl ?? lg ?? md ?? sm ?? xs) != null,
      'input at least 1 value',
    );
    if (width > _xxxl) {
      return (xxxl ?? xxl ?? xl ?? lg ?? md ?? sm ?? xs)!;
    } else if (width > _xxl) {
      return (xxl ?? xl ?? lg ?? md ?? sm ?? xs ?? xxxl)!;
    } else if (width > _xl) {
      return (xl ?? lg ?? md ?? sm ?? xs ?? xxl ?? xxxl)!;
    } else if (width > _lg) {
      return (lg ?? md ?? sm ?? xs ?? xl ?? xxl ?? xxxl)!;
    } else if (width > _md) {
      return (md ?? sm ?? xs ?? lg ?? xl ?? xxl ?? xxxl)!;
    } else if (width > _sm) {
      return (sm ?? xs ?? md ?? lg ?? xl ?? xxl ?? xxxl)!;
    } else {
      return (xs ?? sm ?? md ?? lg ?? xl ?? xxl ?? xxxl)!;
    }
  }
}

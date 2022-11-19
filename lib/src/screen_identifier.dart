library screen_identifier;

class ScreenIdentifier {
  late double width;

  double _xxxl = 1800;
  double _xxl = 1400;
  double _xl = 1200;
  double _lg = 992;
  double _md = 768;
  double _sm = 576;

  static ScreenIdentifier get instance => _instance;
  static final ScreenIdentifier _instance = ScreenIdentifier();

  static ScreenIdentifier init(double screenWidth) {
    return _instance..width = screenWidth;
  }

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

  T conditions<T>({
    T? xxxl,
    T? xxl,
    T? xl,
    T? lg,
    T? md,
    T? sm,
    T? xs,
  }) {
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

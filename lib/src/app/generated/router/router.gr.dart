// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [FaqView]
class FaqRoute extends PageRouteInfo<FaqRouteArgs> {
  FaqRoute({required VoidCallback onBackPressed, List<PageRouteInfo>? children})
    : super(
        FaqRoute.name,
        args: FaqRouteArgs(onBackPressed: onBackPressed),
        initialChildren: children,
      );

  static const String name = 'FaqRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FaqRouteArgs>();
      return FaqView(onBackPressed: args.onBackPressed);
    },
  );
}

class FaqRouteArgs {
  const FaqRouteArgs({required this.onBackPressed});

  final VoidCallback onBackPressed;

  @override
  String toString() {
    return 'FaqRouteArgs{onBackPressed: $onBackPressed}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FaqRouteArgs) return false;
    return onBackPressed == other.onBackPressed;
  }

  @override
  int get hashCode => onBackPressed.hashCode;
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return HomeView();
    },
  );
}

/// generated route for
/// [StartupView]
class StartupRoute extends PageRouteInfo<void> {
  const StartupRoute({List<PageRouteInfo>? children})
    : super(StartupRoute.name, initialChildren: children);

  static const String name = 'StartupRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return StartupView();
    },
  );
}

/// generated route for
/// [StepsBaseView]
class StepsBaseRoute extends PageRouteInfo<void> {
  const StepsBaseRoute({List<PageRouteInfo>? children})
    : super(StepsBaseRoute.name, initialChildren: children);

  static const String name = 'StepsBaseRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return StepsBaseView();
    },
  );
}

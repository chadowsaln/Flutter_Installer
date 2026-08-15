import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_installer/src/ui/views/faq/faq_view.dart';
import 'package:flutter_installer/src/ui/views/home/home_view.dart';
import 'package:flutter_installer/src/ui/views/startup/startup_view.dart';
import 'package:flutter_installer/src/ui/views/steps/steps_base/steps_base_view.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: StartupRoute.page, path: '/', initial: true),
        AutoRoute(page: HomeRoute.page, path: '/home'),
        AutoRoute(page: FaqRoute.page, path: '/faq'),
        AutoRoute(page: StepsBaseRoute.page, path: '/installing'),
      ];
}

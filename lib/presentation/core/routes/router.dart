import 'package:auto_route/auto_route.dart';
import 'package:winsoft_task/presentation/auth/pages/login_page.dart';
import 'package:winsoft_task/presentation/auth/pages/register_page.dart';
import 'package:winsoft_task/presentation/core/pages/splash_page.dart';
import 'package:winsoft_task/presentation/home/pages/home_page.dart';

export 'router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: RegisterPage),
    AutoRoute(page: HomePage)
  ],
)
class $AppRouter {}

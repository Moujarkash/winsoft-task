import 'package:auto_route/auto_route.dart';
import 'package:winsoft_task/presentation/auth/pages/login_page.dart';
import 'package:winsoft_task/presentation/auth/pages/register_page.dart';
import 'package:winsoft_task/presentation/core/pages/main_page.dart';
import 'package:winsoft_task/presentation/core/pages/splash_page.dart';
import 'package:winsoft_task/presentation/home/pages/home_page.dart';
import 'package:winsoft_task/presentation/order/pages/my_orders_page.dart';
import 'package:winsoft_task/presentation/prescription/pages/prescription_page.dart';
import 'package:winsoft_task/presentation/product/pages/products_page.dart';

export 'router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: RegisterPage),
    AutoRoute(
        page: MainPage,
      children: [
        AutoRoute(
          path: "home",
          name: "HomeRouter",
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: HomePage),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute(
          path: "prescription",
          name: "PrescriptionRouter",
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: PrescriptionPage),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute(
          path: "product",
          name: "ProductRouter",
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: ProductsPage),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute(
          path: "order",
          name: "OrderRouter",
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: MyOrdersPage),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
      ],
    )
  ],
)
class $AppRouter {}

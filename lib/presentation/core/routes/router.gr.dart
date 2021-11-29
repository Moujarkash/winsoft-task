// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i10;

import '../../auth/pages/login_page.dart' as _i2;
import '../../auth/pages/register_page.dart' as _i3;
import '../../home/pages/home_page.dart' as _i6;
import '../../order/pages/my_orders_page.dart' as _i9;
import '../../prescription/pages/prescription_page.dart' as _i7;
import '../../product/pages/products_page.dart' as _i8;
import '../pages/main_page.dart' as _i4;
import '../pages/splash_page.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    LoginPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    RegisterPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegisterPage());
    },
    MainPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.MainPage());
    },
    HomeRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    PrescriptionRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    ProductRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    OrderRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    HomePageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.HomePage());
    },
    PrescriptionPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.PrescriptionPage());
    },
    ProductsPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ProductsPage());
    },
    MyOrdersPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.MyOrdersPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SplashPageRoute.name, path: '/'),
        _i5.RouteConfig(LoginPageRoute.name, path: '/login-page'),
        _i5.RouteConfig(RegisterPageRoute.name, path: '/register-page'),
        _i5.RouteConfig(MainPageRoute.name, path: '/main-page', children: [
          _i5.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: MainPageRoute.name,
              children: [
                _i5.RouteConfig(HomePageRoute.name,
                    path: '', parent: HomeRouter.name),
                _i5.RouteConfig('*#redirect',
                    path: '*',
                    parent: HomeRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i5.RouteConfig(PrescriptionRouter.name,
              path: 'prescription',
              parent: MainPageRoute.name,
              children: [
                _i5.RouteConfig(PrescriptionPageRoute.name,
                    path: '', parent: PrescriptionRouter.name),
                _i5.RouteConfig('*#redirect',
                    path: '*',
                    parent: PrescriptionRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i5.RouteConfig(ProductRouter.name,
              path: 'product',
              parent: MainPageRoute.name,
              children: [
                _i5.RouteConfig(ProductsPageRoute.name,
                    path: '', parent: ProductRouter.name),
                _i5.RouteConfig('*#redirect',
                    path: '*',
                    parent: ProductRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i5.RouteConfig(OrderRouter.name,
              path: 'order',
              parent: MainPageRoute.name,
              children: [
                _i5.RouteConfig(MyOrdersPageRoute.name,
                    path: '', parent: OrderRouter.name),
                _i5.RouteConfig('*#redirect',
                    path: '*',
                    parent: OrderRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ])
        ])
      ];
}

/// generated route for [_i1.SplashPage]
class SplashPageRoute extends _i5.PageRouteInfo<void> {
  const SplashPageRoute() : super(name, path: '/');

  static const String name = 'SplashPageRoute';
}

/// generated route for [_i2.LoginPage]
class LoginPageRoute extends _i5.PageRouteInfo<void> {
  const LoginPageRoute() : super(name, path: '/login-page');

  static const String name = 'LoginPageRoute';
}

/// generated route for [_i3.RegisterPage]
class RegisterPageRoute extends _i5.PageRouteInfo<void> {
  const RegisterPageRoute() : super(name, path: '/register-page');

  static const String name = 'RegisterPageRoute';
}

/// generated route for [_i4.MainPage]
class MainPageRoute extends _i5.PageRouteInfo<void> {
  const MainPageRoute({List<_i5.PageRouteInfo>? children})
      : super(name, path: '/main-page', initialChildren: children);

  static const String name = 'MainPageRoute';
}

/// generated route for [_i5.EmptyRouterPage]
class HomeRouter extends _i5.PageRouteInfo<void> {
  const HomeRouter({List<_i5.PageRouteInfo>? children})
      : super(name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for [_i5.EmptyRouterPage]
class PrescriptionRouter extends _i5.PageRouteInfo<void> {
  const PrescriptionRouter({List<_i5.PageRouteInfo>? children})
      : super(name, path: 'prescription', initialChildren: children);

  static const String name = 'PrescriptionRouter';
}

/// generated route for [_i5.EmptyRouterPage]
class ProductRouter extends _i5.PageRouteInfo<void> {
  const ProductRouter({List<_i5.PageRouteInfo>? children})
      : super(name, path: 'product', initialChildren: children);

  static const String name = 'ProductRouter';
}

/// generated route for [_i5.EmptyRouterPage]
class OrderRouter extends _i5.PageRouteInfo<void> {
  const OrderRouter({List<_i5.PageRouteInfo>? children})
      : super(name, path: 'order', initialChildren: children);

  static const String name = 'OrderRouter';
}

/// generated route for [_i6.HomePage]
class HomePageRoute extends _i5.PageRouteInfo<void> {
  const HomePageRoute() : super(name, path: '');

  static const String name = 'HomePageRoute';
}

/// generated route for [_i7.PrescriptionPage]
class PrescriptionPageRoute extends _i5.PageRouteInfo<void> {
  const PrescriptionPageRoute() : super(name, path: '');

  static const String name = 'PrescriptionPageRoute';
}

/// generated route for [_i8.ProductsPage]
class ProductsPageRoute extends _i5.PageRouteInfo<void> {
  const ProductsPageRoute() : super(name, path: '');

  static const String name = 'ProductsPageRoute';
}

/// generated route for [_i9.MyOrdersPage]
class MyOrdersPageRoute extends _i5.PageRouteInfo<void> {
  const MyOrdersPageRoute() : super(name, path: '');

  static const String name = 'MyOrdersPageRoute';
}

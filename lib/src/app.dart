import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winsoft_task/injection.dart';
import 'package:winsoft_task/presentation/auth/blocs/auth/auth_bloc.dart';
import 'package:winsoft_task/presentation/core/routes/router.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          inputDecorationTheme: const InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            contentPadding: EdgeInsets.all(14),
          ),
        ),
        builder: (context, widget) {
          if (widget == null) {
            return Container();
          }

          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(
                physics: const BouncingScrollPhysics(),
              ),
              child: SafeArea(
                top: false,
                left: false,
                right: false,
                child: widget,
              ),
            ),
          );
        },
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}

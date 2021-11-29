import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winsoft_task/presentation/auth/blocs/auth/auth_bloc.dart';
import 'package:winsoft_task/presentation/core/routes/router.dart';
import 'package:winsoft_task/presentation/core/widgets/error_view.dart';
import 'package:winsoft_task/presentation/core/widgets/loader.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final AuthBloc _authBloc;

  @override
  void initState() {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _authBloc.add(AuthCheckRequested());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: _authBloc,
        listenWhen: (previousState, nextState) => nextState is AuthSuccess,
          listener: (context, state) {
            if (state is AuthSuccess) {
              final user = state.user;

              if (user != null) {
                AutoRouter.of(context).replace(const MainPageRoute());
              } else {
                AutoRouter.of(context).replace(const LoginPageRoute());
              }
            }
          },
        buildWhen: (previousState, nextState) => nextState is AuthFailure || nextState is AuthInProgress,
        builder: (context, state) {
            if (state is AuthFailure) {
              return Center(
                child: ErrorView(
                  failure: state.failure,
                  onRetry: () => _authBloc.add(AuthCheckRequested()),
                ),
              );
            } else {
              return const Center(
                child: Loader(),
              );
            }
        },
      ),
    );
  }
}

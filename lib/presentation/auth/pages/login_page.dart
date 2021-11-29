import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:winsoft_task/injection.dart';
import 'package:winsoft_task/presentation/auth/blocs/login/login_bloc.dart';
import 'package:winsoft_task/presentation/core/routes/router.dart';
import 'package:winsoft_task/presentation/core/widgets/controls/password_control.dart';
import 'package:winsoft_task/presentation/core/widgets/screen_loader.dart';
import 'package:winsoft_task/presentation/core/widgets/screen_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with ScreenLoader<LoginPage>, ScreenUtils {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _emailFormFieldKey = GlobalKey<
      FormFieldState>();
  final LoginBloc _loginBloc = getIt<LoginBloc>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late MultiValidator _passwordValidator;

  @override
  void initState() {
    _passwordValidator = MultiValidator([
      RequiredValidator(errorText: 'Field Required'),
      MinLengthValidator(
          8, errorText: 'password must be at least 8 digits long'),
    ]);

    super.initState();
  }

  @override
  Widget screen(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      bloc: _loginBloc,
      listener: (context, state) {
        if (state is LoginInProgress) {
          startLoading();
        } else if (state is LoginFailure) {
          stopLoading();

          showError(failure: state.failure);
        } else if (state is LoginSuccess) {
          stopLoading();

          AutoRouter.of(context).replace(const HomePageRoute());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                TextFormField(
                  key: _emailFormFieldKey,
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onChanged: (text) {
                    _emailFormFieldKey.currentState!.validate();
                  },
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Field Required';
                    }

                    if (!EmailValidator(
                        errorText: 'Please enter a valid email')
                        .isValid(text.toLowerCase())) {
                      return 'Please enter a valid email';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                PasswordControl(
                  hintText: 'Enter your password',
                  controller: _passwordController,
                  validator: _passwordValidator,
                ),
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.primary
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();

                      if (!_formKey.currentState!.validate()) return;

                      _loginBloc.add(
                        LoginRequested(
                          _emailController.text,
                          _passwordController.text,
                        ),
                      );
                    },
                    child: const Text('Login'),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const Text('Don\'t have an account?'),
                    const SizedBox(width: 8,),
                    GestureDetector(
                      onTap: () {
                          AutoRouter.of(context).push(const RegisterPageRoute());
                      },
                      child: Text('Signup', style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

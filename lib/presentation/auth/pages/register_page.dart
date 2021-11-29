import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:winsoft_task/domain/auth/entities/gender.dart';
import 'package:winsoft_task/injection.dart';
import 'package:winsoft_task/presentation/auth/blocs/signup/signup_bloc.dart';
import 'package:winsoft_task/presentation/core/routes/router.dart';
import 'package:winsoft_task/presentation/core/widgets/controls/password_control.dart';
import 'package:winsoft_task/presentation/core/widgets/screen_loader.dart';
import 'package:winsoft_task/presentation/core/widgets/screen_utils.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with ScreenLoader<RegisterPage>, ScreenUtils {
  final SignupBloc _signupBloc = getIt<SignupBloc>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();

  final RequiredValidator _requiredValidator =
  RequiredValidator(errorText: 'Field Required');
  late final MultiValidator _emailValidator;
  late final MultiValidator _passwordValidator;

  Gender _selectedGender = Gender.male;
  DateTime? _selectedDateOfBirth;

  @override
  void initState() {
    _emailValidator = MultiValidator([
      _requiredValidator,
      EmailValidator(errorText: 'Please enter a valid email'),
    ]);

    _passwordValidator = MultiValidator([
      _requiredValidator,
      MinLengthValidator(8,
          errorText: 'password must be at least 8 digits long'),
    ]);

    super.initState();
  }

  @override
  Widget screen(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      bloc: _signupBloc,
      listener: (context, state) {
        if (state is SignupInProgress) {
          startLoading();
        } else if (state is SignupFailure) {
          stopLoading();

          showError(failure: state.failure);
        } else if (state is SignupSuccess) {
          stopLoading();

          AutoRouter.of(context).replace(const HomePageRoute());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Signup'),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    hintText: 'First name',
                  ),
                  textInputAction: TextInputAction.next,
                  validator: _requiredValidator,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    hintText: 'Last name',
                  ),
                  textInputAction: TextInputAction.next,
                  validator: _requiredValidator,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: _emailValidator,
                ),
                const SizedBox(
                  height: 20,
                ),
                PasswordControl(
                  hintText: 'Password',
                  controller: _passwordController,
                  validator: _passwordValidator,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    hintText: 'Phone',
                  ),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  validator: _requiredValidator,
                ),
                const SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    Radio<Gender>(value: Gender.male, groupValue: _selectedGender, onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    }),
                    const SizedBox(width: 4,),
                    const Text('Male'),

                    Radio<Gender>(value: Gender.female, groupValue: _selectedGender, onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    }),
                    const SizedBox(width: 4,),
                    const Text('Female'),

                    Radio<Gender>(value: Gender.other, groupValue: _selectedGender, onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    }),
                    const SizedBox(width: 4,),
                    const Text('Other'),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                TextFormField(
                  controller: _dateOfBirthController,
                  decoration: const InputDecoration(
                    hintText: 'Date of birth',
                  ),
                  readOnly: true,
                  textInputAction: TextInputAction.done,
                  validator: _requiredValidator,
                  onTap: () async {
                    _selectedDateOfBirth = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1970),
                        lastDate: DateTime.now());

                    if (_selectedDateOfBirth != null) {
                      _dateOfBirthController.text =
                          _selectedDateOfBirth!.toIso8601String();
                    }
                  },
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

                      _signupBloc.add(
                        SignupRequested(
                          _firstNameController.text,
                          _lastNameController.text,
                          _emailController.text,
                          _passwordController.text,
                          _phoneController.text,
                          _selectedGender,
                          _selectedDateOfBirth!,
                        ),
                      );
                    },
                    child: const Text('Sign up'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

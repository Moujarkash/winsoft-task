import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:winsoft_task/domain/auth/entities/gender.dart';
import 'package:winsoft_task/domain/auth/entities/user.dart';
import 'package:winsoft_task/domain/auth/usecases/signup_use_case.dart';
import 'package:winsoft_task/domain/core/entities/failures.dart';

part 'signup_event.dart';

part 'signup_state.dart';

@injectable
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUseCase signupUseCase;

  SignupBloc(this.signupUseCase) : super(SignupInitial()) {
    on<SignupRequested>((event, emit) async {
      emit(SignupInProgress());

      final result = await signupUseCase.call(SignupUseCaseParams(
          event.firstName,
          event.lastName,
          event.email,
          event.password,
          event.phone,
          event.gender,
          event.dateOfBirth));
      emit(result.fold(
          (failure) => SignupFailure(failure), (user) => SignupSuccess(user)));
    });
  }
}

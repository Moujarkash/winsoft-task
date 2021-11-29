import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:winsoft_task/domain/auth/entities/user.dart';
import 'package:winsoft_task/domain/auth/usecases/login_use_case.dart';
import 'package:winsoft_task/domain/core/entities/failures.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(LoginInProgress());

      final result = await loginUseCase.call(LoginUseCaseParams(event.email, event.password));
      emit(
        result.fold((failure) => LoginFailure(failure), (user) => LoginSuccess(user))
      );
    });
  }
}

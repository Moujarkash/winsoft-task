import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:winsoft_task/domain/auth/entities/user.dart';
import 'package:winsoft_task/domain/auth/usecases/get_signed_in_user_use_case.dart';
import 'package:winsoft_task/domain/core/entities/failures.dart';
import 'package:winsoft_task/domain/core/usecases/usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetSignedInUserUseCase getSignedInUserUseCase;

  AuthBloc(this.getSignedInUserUseCase) : super(AuthInitial()) {
    on<AuthCheckRequested>((event, emit) async {
      emit(AuthInProgress());

      final result = await getSignedInUserUseCase.call(NoParams());
      emit(
        result.fold((failure) => AuthFailure(failure), (user) => AuthSuccess(user))
      );
    });
  }
}

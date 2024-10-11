import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(
          AuthInitial(
            passHidden: true,
            isVisible: false,
            isPasswordEightCharacters: false,
            hasPasswordOneNumber: false,
          ),
        ) {
    on<AuthEvent>(
      (event, emit) {},
    );
    on<TogglePassHiddenEvent>((event, emit) {
      if (state is AuthInitial)
        emit(state.copyWith(passHidden: !state.passHidden));
    });
  }
}

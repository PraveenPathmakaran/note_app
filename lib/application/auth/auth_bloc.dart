import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:note_app/domain/auth/i_auth_facade.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;
  AuthBloc(this._authFacade) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        authCheckRequested: (value) async {
          final userOption = await _authFacade.getSignedInUser();
          await userOption.fold(
            () async => emit(const AuthState.unAuthenticated()),
            (a) async => emit(const AuthState.authenticated()),
          );
        },
        signedOut: (value) async {
          await _authFacade.signOut();
          emit(const AuthState.unAuthenticated());
        },
      );
    });
  }
}

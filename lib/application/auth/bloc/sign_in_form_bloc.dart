import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_app/domain/auth/auth_failure.dart';
import 'package:note_app/domain/auth/value_objects.dart';

import '../../../domain/auth/i_auth_facade.dart';

part 'sign_in_form_bloc.freezed.dart';
part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) async {
      await event.map(
        emailChanged: (e) async {
          emit(state.copyWith(
            emailAddress: EmailAddress(e.emailStr),
            authFailureOrSuccessOption: none(),
          ));
        },
        passwordChanged: (e) async {
          emit(state.copyWith(
            password: Password(e.passwordStr),
            authFailureOrSuccessOption: none(),
          ));
        },
        registerWithEmailAndPasswordPressed: (e) async {
          await _performActionOnAuthFacadeWithEmailAndPassword(
            event,
            emit,
            _authFacade.registerWithEmailAndPassword,
          );
        },
        signInWithEmailAndPasswordPressed: (e) async {
          await _performActionOnAuthFacadeWithEmailAndPassword(
            event,
            emit,
            _authFacade.signInWithEmailAndPassword,
          );
        },
        signInWithGooglePressed: (e) async {
          emit(state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ));
          final failureOrSuccess = await _authFacade.signInWithGoogle();
          emit(state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOption: some(failureOrSuccess),
          ));
        },
      );
    });
  }
  Future<void> _performActionOnAuthFacadeWithEmailAndPassword(
    SignInFormEvent event,
    Emitter<SignInFormState> emit,
    Future<Either<AuthFailure, Unit>> Function({
      required EmailAddress emailAddress,
      required Password password,
    }) forwardedCall,
  ) async {
    final bool isEmailValid = state.emailAddress.isValid();
    final bool isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));
      Either<AuthFailure, Unit> failureOrSuccess = await forwardedCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );

      emit(
        state.copyWith(
            isSubmitting: false,
            showErrorMessages: true,
            authFailureOrSuccessOption: optionOf(failureOrSuccess)),
      );
    } else {
      emit(
        state.copyWith(
            isSubmitting: false,
            showErrorMessages: true,
            authFailureOrSuccessOption: none()),
      );
    }
  }
}
// @override
//   Stream<AuthState> mapEventToState( AuthEvent event,) async* {
//     yield* event.map(
//       authCheckRequested: (e) async*{
//         final userOption = await _authFacade.getSignedInUserId();
//         yield userOption.fold(
//           () => const AuthState.unauthenticated(),
//           (_) => const AuthState.authenticated(),
//         );

//       }, 
//       signedOut: (e) async*{
//         await _authFacade.signOut();
//         yield const AuthState.unauthenticated();
//       }
//     );
//   }
// }


// class MyBloc extends Bloc<MyEvent, MyState> {
//   MyBloc() : super(MyState.initial()) {
//     on<MyEvent>(_onEvent);
//   }

//   Future<void> _onEvent(MyEvent event, Emit<MyState> emit) async {
//     await event.map(
//       authCheckRequested: (e) async {
//         final userOption = await _authFacade.getSignedInUserId();
//         emit(userOption.fold(
//           () => const AuthState.unauthenticated(),
//           (_) => const AuthState.authenticated(),
//         ));
//       },
//       signedOut: (e) async {
//         await _authFacade.signOut();
//         emit(const AuthState.unauthenticated());
//       },
//       ...
//   }
// }
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:phone_app/domain/auth/repo/auth_repo.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final Authentication authentication;
  AuthenticationBloc({
    required this.authentication,
  }) : super(AuthenticationState.initial()) {
    on<SignIn>((event, emit) {
      emit(const AuthenticationState(
        isLoading: true,
        isError: false,
      ));
      authentication.signInWithPhone(event.contextss, event.phoneNumber);
      emit(const AuthenticationState(
        isLoading: false,
        isError: false,
      ));
    });

    on<VerifyOTP>((event, emit) {
      emit(const AuthenticationState(
        isLoading: true,
        isError: false,
      ));
      authentication.verifyOTP(
        context: event.context,
        verificationId: event.verificationId,
        userOTP: event.userOTP,
      );
      emit(const AuthenticationState(
        isLoading: false,
        isError: false,
      ));
    });
  }
}

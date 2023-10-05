part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    required bool isLoading,
    required bool isError,
  }) = _Initial;

  factory AuthenticationState.initial() => const AuthenticationState(
        isLoading: false,
        isError: false,
      );
}

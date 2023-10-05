part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.signIn({
    required BuildContext contextss,
    required String phoneNumber,
  }) = SignIn;
  const factory AuthenticationEvent.verifyOTP({
    required BuildContext context,
    required String userOTP,
    required String verificationId,
  }) = VerifyOTP;
}

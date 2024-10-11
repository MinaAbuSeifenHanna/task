part of 'auth_bloc.dart';

@immutable
// ignore: must_be_immutable
sealed class AuthState {
  bool passHidden;
  bool isVisible;
  bool isPasswordEightCharacters;
  bool hasPasswordOneNumber;
  AuthState({
    required this.isVisible,
    required this.isPasswordEightCharacters,
    required this.hasPasswordOneNumber,
    required this.passHidden,
  });
  AuthInitial copyWith({
    bool? passHidden,
    bool? isVisible,
    bool? isPasswordEightCharacters,
    bool? hasPasswordOneNumber,
  }) =>
      AuthInitial(
        passHidden: passHidden ?? this.passHidden,
        isVisible: isVisible ?? this.isVisible,
        isPasswordEightCharacters:
            isPasswordEightCharacters ?? this.isPasswordEightCharacters,
        hasPasswordOneNumber: hasPasswordOneNumber ?? this.hasPasswordOneNumber,
      );
}

// ignore: must_be_immutable
class AuthInitial extends AuthState {
  AuthInitial({
    required super.passHidden,
    required super.isVisible,
    required super.isPasswordEightCharacters,
    required super.hasPasswordOneNumber,
  });
}

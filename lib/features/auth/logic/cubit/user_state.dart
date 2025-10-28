import '../../data/model/user_model.dart';

class UserState {
  final UserModel? user;
  final bool isLoading;
  final bool isSignIn;
  final bool isAuthenticated;
  final String? error;

  const UserState({
    this.user,
    this.isLoading = false,
    this.isAuthenticated = false,
    this.isSignIn = false,
    this.error,
  });

  UserState copyWith({
    UserModel? user,
    bool? isLoading,
    bool? isAuthenticated,
    bool? isSignIn,
    String? error,
  }) {
    return UserState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isSignIn: isSignIn ?? this.isSignIn,
      error: error,
    );
  }
}

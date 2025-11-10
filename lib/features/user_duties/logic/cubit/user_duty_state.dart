import '../../data/model/user_duty_model.dart';

class UserDutyState {
  final List<UserDutyModel> duties;
  final bool isLoading;
  final String? error;

  UserDutyState({
    this.duties = const [],
    this.isLoading = false,
    this.error,
  });

  UserDutyState copyWith({
    List<UserDutyModel>? duties,
    bool? isLoading,
    String? error,
  }) {
    return UserDutyState(
      duties: duties ?? this.duties,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

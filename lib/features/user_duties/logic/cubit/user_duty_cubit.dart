import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/services/user_duty_services.dart';
import 'user_duty_state.dart';

class UserDutyCubit extends Cubit<UserDutyState> {
  final UserDutyServices services;

  UserDutyCubit(this.services) : super(UserDutyState());

  String? get currentUserId => services.currentUserId;

  Future<void> loadUserDuties() async {
    try {
      emit(state.copyWith(isLoading: true));
      final duties = await services.fetchUserDuties();
      emit(state.copyWith(duties: duties, isLoading: false));
    } on FirebaseException catch (e) {
      emit(state.copyWith(isLoading: false, error: e.message ?? 'Firestore hatası'));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> refreshSilently() async {
    try {
      final duties = await services.fetchUserDuties();
      emit(state.copyWith(duties: duties));
    } catch (_) {
      // Sessizce başarısız ol
    }
  }
}

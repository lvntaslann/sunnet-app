import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/user_duty_model.dart';

class UserDutyServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? _user = FirebaseAuth.instance.currentUser;

  // Kullanıcı ID'sine erişim için getter ekle
  String? get currentUserId => _user?.uid;

  Future<List<UserDutyModel>> fetchUserDuties() async {
    try {
      final uid = _user?.uid;
      if (uid == null) return [];

      final duties = <UserDutyModel>[];

      // Tüm kanalları tara
      final channelsSnapshot = await _firestore.collectionGroup('user_channels').get();

      for (final channelDoc in channelsSnapshot.docs) {
        final channelData = channelDoc.data();
        final channelId = channelDoc.id;
        final channelName = (channelData['title'] as String?) ?? 'İsimsiz Kanal';

        // Bu kanaldaki members içinde kullanıcıyı bul
        final members = (channelData['members'] as List<dynamic>?) ?? [];
        final userMember = members.firstWhere(
          (m) => m['id'] == uid,
          orElse: () => null,
        );

        if (userMember == null) continue;

        // Kullanıcının görevlerini al
        final userDuties = (userMember['duties'] as List<dynamic>?) ?? [];
        for (final dutyJson in userDuties) {
          if (dutyJson is Map<String, dynamic>) {
            duties.add(UserDutyModel.fromJson(dutyJson, channelId, channelName));
          }
        }
      }

      // En yeni görevler önce
      duties.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return duties;
    } catch (e) {
      rethrow;
    }
  }
}

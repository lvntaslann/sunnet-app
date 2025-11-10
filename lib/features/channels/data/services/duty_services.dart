import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/duty_model.dart';

class DutyServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? _user = FirebaseAuth.instance.currentUser;

  Future<void> assignDuty(String channelId, DutyModel duty) async {
    try {
      final channelRef = _firestore
          .collection('channels')
          .doc(_user?.uid)
          .collection('user_channels')
          .doc(channelId);

      final channelDoc = await channelRef.get();
      if (!channelDoc.exists) return;

      final channelData = channelDoc.data()!;
      final members = (channelData['members'] as List<dynamic>?) ?? [];
      for (var i = 0; i < members.length; i++) {
        if (members[i]['id'] == duty.assignedTo) {
          final memberDuties = (members[i]['duties'] as List<dynamic>?) ?? [];
          memberDuties.add(duty.toMap());
          members[i]['duties'] = memberDuties;
          break;
        }
      }
      await channelRef.update({'members': members});
    } catch (e) {
      rethrow;
    }
  }

  Future<List<DutyModel>> fetchAllDuties(String channelId) async {
    try {
      final channelDoc = await _firestore
          .collection('channels')
          .doc(_user?.uid)
          .collection('user_channels')
          .doc(channelId)
          .get();

      if (!channelDoc.exists) return [];

      final channelData = channelDoc.data()!;
      final members = (channelData['members'] as List<dynamic>?) ?? [];

      final allDuties = <DutyModel>[];
      for (var member in members) {
        final duties = (member['duties'] as List<dynamic>?) ?? [];
        allDuties.addAll(
          duties.map((d) => DutyModel.fromMap(d as Map<String, dynamic>)),
        );
      }

      return allDuties;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateDutyStatus({
    required String channelId,
    required String memberId,
    required String dutyId,
    required String newStatus,
  }) async {
    try {
      final channelsSnap = await _firestore.collectionGroup('user_channels').get();
      DocumentReference<Map<String, dynamic>>? channelRef;

      for (final doc in channelsSnap.docs) {
        if (doc.id == channelId) {
          channelRef = doc.reference;
          break;
        }
      }

      if (channelRef == null) throw Exception('Channel not found');

      await _firestore.runTransaction((tx) async {
        final snap = await tx.get(channelRef!);
        final data = snap.data() as Map<String, dynamic>;
        final members = (data['members'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];

        final memberIndex = members.indexWhere((m) => m['id'] == memberId);
        if (memberIndex == -1) throw Exception('Member not found');

        final duties = (members[memberIndex]['duties'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];
        final dutyIndex = duties.indexWhere((d) => d['id'] == dutyId);
        if (dutyIndex == -1) throw Exception('Duty not found');

        duties[dutyIndex]['status'] = newStatus;
        members[memberIndex]['duties'] = duties;

        tx.update(channelRef, {'members': members});
      });
    } catch (e) {
      rethrow;
    }
  }
}

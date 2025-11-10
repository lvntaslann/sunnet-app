import 'package:cloud_firestore/cloud_firestore.dart';

class UserDutyModel {
  final String dutyId;
  final String dutyName;
  final String channelId;
  final String channelName;
  final List<String> tasks;
  final String status;
  final Timestamp createdAt;

  UserDutyModel({
    required this.dutyId,
    required this.dutyName,
    required this.channelId,
    required this.channelName,
    required this.tasks,
    required this.status,
    required this.createdAt,
  });

  factory UserDutyModel.fromJson(Map<String, dynamic> json, String channelId, String channelName) {
    // Handle createdAt as both String and Timestamp
    Timestamp parsedCreatedAt;
    final createdAtValue = json['createdAt'];

    if (createdAtValue is Timestamp) {
      parsedCreatedAt = createdAtValue;
    } else if (createdAtValue is String) {
      try {
        final dateTime = DateTime.parse(createdAtValue);
        parsedCreatedAt = Timestamp.fromDate(dateTime);
      } catch (e) {
        parsedCreatedAt = Timestamp.now();
      }
    } else {
      parsedCreatedAt = Timestamp.now();
    }

    return UserDutyModel(
      dutyId: json['id'] as String? ?? '',
      dutyName: json['name'] as String? ?? '',
      channelId: channelId,
      channelName: channelName,
      tasks: (json['tasks'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      status: json['status'] as String? ?? 'pending',
      createdAt: parsedCreatedAt,
    );
  }
}

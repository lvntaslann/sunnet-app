import 'package:cloud_firestore/cloud_firestore.dart';

class DutyModel {
  final String id;
  final String name;
  final List<String> tasks;
  final String assignedTo;
  final String createdBy;
  final String status;
  final DateTime createdAt;

  DutyModel({
    required this.id,
    required this.name,
    required this.tasks,
    required this.assignedTo,
    required this.createdBy,
    required this.status,
    required this.createdAt,
  });

  factory DutyModel.fromJson(Map<String, dynamic> json) {
    return DutyModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      tasks: List<String>.from(json['tasks'] ?? []),
      assignedTo: json['assignedTo'] ?? '',
      createdBy: json['createdBy'] ?? '',
      status: json['status'] ?? 'pending',
      createdAt: json['createdAt'] is Timestamp
          ? (json['createdAt'] as Timestamp).toDate()
          : DateTime.parse(json['createdAt'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'tasks': tasks,
      'assignedTo': assignedTo,
      'createdBy': createdBy,
      'status': status,
      'createdAt': createdAt,
    };
  }

  factory DutyModel.fromMap(Map<String, dynamic> map) {
    return DutyModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      tasks: List<String>.from(map['tasks'] ?? []),
      assignedTo: map['assignedTo'] ?? '',
      createdBy: map['createdBy'] ?? '',
      status: map['status'] ?? 'pending',
      createdAt: map['createdAt'] is Timestamp 
          ? (map['createdAt'] as Timestamp).toDate()
          : DateTime.parse(map['createdAt'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tasks': tasks,
      'assignedTo': assignedTo,
      'createdBy': createdBy,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

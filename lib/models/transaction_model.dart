import 'dart:convert';

class TransactionDataModel {
  final int userId;
  final int id;
  final String title;
  final String body;
  TransactionDataModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory TransactionDataModel.fromMap(Map<String, dynamic> map) {
    return TransactionDataModel(
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionDataModel.fromJson(String source) => TransactionDataModel.fromMap(json.decode(source));
}
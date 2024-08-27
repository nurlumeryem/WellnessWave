import 'package:flutter_application_1/features/meditation/domain/entities/mood_message.dart';

class MoodMessageModel extends MoodMessage {
  MoodMessageModel({required super.text});

  factory MoodMessageModel.fromJson(Map<String, dynamic> json) {
    return MoodMessageModel(text: json['text']);
  }
}

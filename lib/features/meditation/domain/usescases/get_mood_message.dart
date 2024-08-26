import 'package:flutter_application_1/features/meditation/domain/entities/mood_message.dart';
import 'package:flutter_application_1/features/meditation/domain/repositories/meditation_repository.dart';

class GetMoodMessage {
  final MeditationRepository repository;

  GetMoodMessage({required this.repository});

  Future<MoodMessage> call(String mood) async {
    return await repository.getMoodMessage(mood);
  }
}

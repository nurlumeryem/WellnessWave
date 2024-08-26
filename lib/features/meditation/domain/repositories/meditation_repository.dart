import 'package:flutter_application_1/features/meditation/domain/entities/daily_quote.dart';
import 'package:flutter_application_1/features/meditation/domain/entities/mood_message.dart';

abstract class MeditationRepository {
  Future<DailyQuote> getDailyQuote();
  Future<MoodMessage> getMoodMessage(String mood);
}

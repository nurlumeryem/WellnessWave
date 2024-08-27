import 'package:flutter_application_1/features/meditation/domain/usescases/get_daily_quote.dart';
import 'package:flutter_application_1/features/meditation/presentation/bloc/daily_quote/daily_quote_event.dart';
import 'package:flutter_application_1/features/meditation/presentation/bloc/daily_quote/daily_quote_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyQuoteBloc extends Bloc<DailyQuoteEvent, DailyQuoteState> {
  final GetDailyQuote getDailyQuote;

  DailyQuoteBloc({required this.getDailyQuote}) : super(DailyQuoteInitial()) {
    on<FetchDailyQuote>((event, emit) async {
      emit(DailyQuoteLoading());
      try {
        final dailyQuote = await getDailyQuote();
        emit(DailyQuoteLoaded(dailyQuote: dailyQuote));
      } catch (e) {
        emit(DailyQuoteError(message: e.toString()));
      }
    });
  }
}

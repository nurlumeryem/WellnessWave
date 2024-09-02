import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/meditation/presentation/bloc/daily_quote/daily_quote_bloc.dart';
import 'package:flutter_application_1/features/meditation/presentation/bloc/daily_quote/daily_quote_event.dart';
import 'package:flutter_application_1/features/meditation/presentation/bloc/mood_message/mood_message_bloc.dart';
import 'package:flutter_application_1/features/music/presentation/bloc/song_bloc.dart';
import 'package:flutter_application_1/features/music/presentation/bloc/song_event.dart';
import 'package:flutter_application_1/presentation/bottomNavBar/bloc/navigation_bloc.dart';
import 'package:flutter_application_1/presentation/homePage/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => NavigationBloc(),
          ),
          BlocProvider(
              create: (context) => di.sl<SongBloc>()..add(FetchSongs())),
          BlocProvider(
            create: (context) =>
                di.sl<DailyQuoteBloc>()..add(FetchDailyQuote()),
          ),
          BlocProvider(create: (context) => di.sl<MoodMessageBloc>())
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
              useMaterial3: true,
            ),
            home: HomeScreen()));
  }
}

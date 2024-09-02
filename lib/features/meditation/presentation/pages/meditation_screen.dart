import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme.dart';
import 'package:flutter_application_1/features/meditation/presentation/bloc/daily_quote/daily_quote_bloc.dart';
import 'package:flutter_application_1/features/meditation/presentation/bloc/daily_quote/daily_quote_state.dart';
import 'package:flutter_application_1/features/meditation/presentation/bloc/mood_message/mood_message_bloc.dart';
import 'package:flutter_application_1/features/meditation/presentation/bloc/mood_message/mood_message_event.dart';
import 'package:flutter_application_1/features/meditation/presentation/bloc/mood_message/mood_message_state.dart';
import 'package:flutter_application_1/features/meditation/presentation/widgets/feeling_button.dart';
import 'package:flutter_application_1/features/meditation/presentation/widgets/task_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Image.asset('assets/menu_burger.png'),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile.png'),
          ),
          SizedBox(
            width: 26,
          )
        ],
      ),
      backgroundColor: DefaultColors.white,
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Tekrardan hoş geldin, Meryem!",
                  style: TextStyle(fontSize: FontSizes.extraLarge)),
              SizedBox(
                height: 12,
              ),
              const SizedBox(height: 22),
              Text("Bugün kendini nasıl hissediyorsun?",
                  style: TextStyle(fontSize: FontSizes.standard)),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FeelingButton(
                      label: "Mutlu",
                      image: 'assets/happy.png',
                      color: DefaultColors.task1,
                      onTap: () {
                        context.read<MoodMessageBloc>().add(FetchMoodMessage(
                            'Bugün kendimi mutlu hissediyorum'));
                      }),
                  FeelingButton(
                      label: "Sakin",
                      image: 'assets/calm.png',
                      color: DefaultColors.task1,
                      onTap: () {
                        context.read<MoodMessageBloc>().add(FetchMoodMessage(
                            'Bugün kendimi sakin hissediyorum'));
                      }),
                  FeelingButton(
                      label: "Relax",
                      image: 'assets/yoga.png',
                      color: DefaultColors.task1,
                      onTap: () {
                        context.read<MoodMessageBloc>().add(
                            FetchMoodMessage('Bugün rahatlamış hissediyorum'));
                      }),
                  FeelingButton(
                      label: "Odaklan",
                      image: 'assets/focus.png',
                      color: DefaultColors.task1,
                      onTap: () {
                        context.read<MoodMessageBloc>().add(FetchMoodMessage(
                            'Bugün odaklanmam gerekiyor ama bir şeylerin eksik olduğunu hissediyorum'));
                      })
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder<DailyQuoteBloc, DailyQuoteState>(
                  builder: (context, state) {
                if (state is DailyQuoteLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is DailyQuoteLoaded) {
                  return Column(
                    children: [
                      TaskCard(
                        title: 'Güne Başlarken 🌅',
                        description:
                            'Güneş, karanlıktan tekrar yükselebileceğimizi ve kendi ışığımızı parlatabileceğimizi hatırlatan günlük bir işarettir.',
                        color: DefaultColors.task1,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TaskCard(
                        title: 'Enerji Toplama Zamanı ☕',
                        description:
                            'Öğle vaktinin sessizliğinde, endişelerden kurtulmak ve anı kucaklamak için sessiz gücü bulun.',
                        color: DefaultColors.task2,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TaskCard(
                        title: 'Günü Tamamlarken 🌙',
                        description:
                            'Gün sonlandığında, taşıdığınız yükleri bırakın. Elinizden geleni yaptığınızı bilerek huzura bürünün.',
                        color: DefaultColors.task3,
                      )
                    ],
                  );
                } else if (state is DailyQuoteError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      'Veri bulunamadı',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  );
                }
              }),
              BlocBuilder<MoodMessageBloc, MoodMessageState>(
                builder: (context, state) {
                  if (state is MoodMessageLoaded) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text(
                                  'Senin için tavsiyem',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                content: Text(
                                  state.moodMessage.text,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        context
                                            .read<MoodMessageBloc>()
                                            .add(ResetMoodMessage());
                                      },
                                      child: const Text('Tamam'))
                                ],
                              ));
                    });
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme.dart';
import 'package:flutter_application_1/features/meditation/presentation/widgets/feeling_button.dart';
import 'package:flutter_application_1/features/meditation/presentation/widgets/task_card.dart';

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
            width: 16,
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tekrardan hoş geldin, Meryem!",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 32),
              Text("Bugün kendini nasıl hissediyorsun ?",
                  style: Theme.of(context).textTheme.titleMedium),
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
                  ),
                  FeelingButton(
                      label: "Sakin",
                      image: 'assets/calm.png',
                      color: DefaultColors.task1),
                  FeelingButton(
                      label: "Relax",
                      image: 'assets/yoga.png',
                      color: DefaultColors.task1),
                  FeelingButton(
                      label: "Odaklan",
                      image: 'assets/focus.png',
                      color: DefaultColors.task1),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Bugünün Görevleri',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 24,
              ),
              TaskCard(
                title: 'Güne Başlarken 🌅',
                description: '',
                color: DefaultColors.task1,
              ),
              SizedBox(
                height: 16,
              ),
              TaskCard(
                title: 'Enerji Toplama Zamanı ☕',
                description: '',
                color: DefaultColors.task2,
              ),
              SizedBox(
                height: 16,
              ),
              TaskCard(
                title: 'Günü Tamamlarken 🌙',
                description: '',
                color: DefaultColors.task3,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/bottomNavBar/bloc/navigation_bloc.dart';
import 'package:flutter_application_1/presentation/bottomNavBar/bloc/navigation_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;

  BottomNavBar({Key? key, required this.items, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      currentIndex: currentIndex,
      onTap: (index) {
        context.read<NavigationBloc>().add(NavigateTo(index: index));
      },
    );
  }
}

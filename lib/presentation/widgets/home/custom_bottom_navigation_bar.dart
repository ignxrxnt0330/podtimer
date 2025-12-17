import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:podtimer/presentation/blocs/home/home_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      enableFeedback: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: context.read<HomeBloc>().state.index,
      onTap: (index) {
        if (index != context.read<HomeBloc>().state.index) {
          context.read<HomeBloc>().add(IndexChanged(index));
          context.go('/home/$index');
        }
      },
    );
  }
}

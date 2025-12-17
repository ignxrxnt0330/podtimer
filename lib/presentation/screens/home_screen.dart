import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podtimer/main.dart';
import 'package:podtimer/presentation/blocs/home/home_bloc.dart';
import 'package:podtimer/presentation/widgets/home/custom_bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  final int index;
  const HomeScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: mainAppKey.currentState!.pages.elementAt(
          context.read<HomeBloc>().state.index,
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

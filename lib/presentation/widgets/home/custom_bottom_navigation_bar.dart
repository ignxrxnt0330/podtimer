import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:podtimer/l10n/app_localizations.dart';
import 'package:podtimer/presentation/blocs/home/home_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
      final localizations = AppLocalizations.of(context)!;
        return BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          enableFeedback: false,
          currentIndex: state.index,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: localizations.home),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: localizations.search),
            BottomNavigationBarItem( icon: Icon(Icons.favorite), label: localizations.following),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: localizations.profile),
          ],
          onTap: (index) {
            if (index != state.index) {
              context.read<HomeBloc>().add(IndexChanged(index));
              context.go('/home/$index');
            }
          },
        );
      },
    );
  }
}

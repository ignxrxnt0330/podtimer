import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'config_event.dart';
part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  ConfigBloc() : super(const ConfigState()) {
    on<DarkModeChanged>((event, emit) async {
      emit(state.copyWith(darkMode: event.darkMode));
    });
  }
}

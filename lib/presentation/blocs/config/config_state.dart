part of 'config_bloc.dart';

class ConfigState extends Equatable {
  final bool darkMode;
  const ConfigState({this.darkMode = false});

  ConfigState copyWith({bool? darkMode}) {
    return ConfigState(darkMode: darkMode ?? this.darkMode);
  }

  @override
  List<Object> get props => [darkMode];
}

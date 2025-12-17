part of 'config_bloc.dart';

abstract class ConfigEvent {
  const ConfigEvent();
}

class DarkModeChanged extends ConfigEvent {
  final bool darkMode;
  const DarkModeChanged(this.darkMode);
}

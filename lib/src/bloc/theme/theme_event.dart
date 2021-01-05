part of 'theme_bloc.dart';

/// A toggle event, that indicates we need to switch the current theme.
///
/// In theory, this should be an abstract base class from which we extend all
/// possible events handled by this BLoC, but we only really have a single event,
/// so that would be redundant.
class ThemeSwitchEvent extends Equatable {
  const ThemeSwitchEvent();

  @override
  List<Object> get props => [];
}

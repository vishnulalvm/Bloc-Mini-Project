part of 'postbloc_bloc.dart';

@immutable
sealed class PostblocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostRequiestEvent extends PostblocEvent {
   PostRequiestEvent();

  @override
  List<Object?> get props => [];
}

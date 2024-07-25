part of 'postbloc_bloc.dart';

@immutable
sealed class PostblocState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class PostblocInitial extends PostblocState {}

final class Postblocloading extends PostblocState {}

final class Postblocloaded extends PostblocState {
  final List<PostEntity> posts;
  Postblocloaded({required this.posts});
  @override
  List<Object?> get props => [];
}

final class Postblocerror extends PostblocState {
  final String error;
  Postblocerror({required this.error});
  @override
  List<Object?> get props => [];
}



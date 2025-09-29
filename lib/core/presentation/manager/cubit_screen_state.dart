import 'package:equatable/equatable.dart';

abstract class CubitScreenState extends Equatable {
  const CubitScreenState();

  @override
  List<Object?> get props => [];
}

class CubitScreenInitial extends CubitScreenState {}

class CubitScreenLoading extends CubitScreenState {}

class CubitScreenLoaded extends CubitScreenState {
  final dynamic data;
  const CubitScreenLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class CubitScreenError extends CubitScreenState {
  final String message;
  const CubitScreenError(this.message);

  @override
  List<Object?> get props => [message];
}

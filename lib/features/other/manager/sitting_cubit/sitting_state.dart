import '../../data/models/Sitting_Response.dart';

abstract class SittingState{}
class SittingInitial extends SittingState{}
class SittingLoading extends SittingState{}
class SittingSuccess extends SittingState{
  final SittingResponse sittingResponse;
  SittingSuccess(this.sittingResponse);
}
class SittingError extends SittingState{
  final String error;
  SittingError(this.error);
}
import '../data/models/onbordingResponse.dart';

abstract class OnBordingState2{}

class OnbordingInitial extends OnBordingState2{}

class OnBordingLoading extends OnBordingState2{}

class OnbordingError extends OnBordingState2{
  final String error;
 OnbordingError({required this.error});
}

class OnbordingSuccess extends OnBordingState2{
  final List<Data> data;
  OnbordingSuccess({required this.data});
}
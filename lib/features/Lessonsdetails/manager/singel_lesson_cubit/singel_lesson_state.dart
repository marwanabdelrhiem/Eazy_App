
import '../../data/model/singel_lesson_response.dart';

abstract class SingelLessonState{}
class SingelLessonInitial extends SingelLessonState{}
class SingelLessonLoading extends SingelLessonState{}
class SingelLessonSuccess extends SingelLessonState{
  final SingleLessonResponse data;
  SingelLessonSuccess(this.data);
}
class SingelLessonError extends SingelLessonState{
  final String error;
  SingelLessonError(this.error);
}
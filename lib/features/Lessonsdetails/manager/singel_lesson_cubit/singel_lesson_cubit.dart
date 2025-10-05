import 'package:eazy_app/features/Lessonsdetails/manager/singel_lesson_cubit/singel_lesson_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/singel_lesson_repo.dart';
class SingelLessonCubit extends Cubit<SingelLessonState>{
  SingelLessonCubit() : super(SingelLessonInitial());
  static SingelLessonCubit get(context) => BlocProvider.of(context);
  void getHomeData({
    required int id
  }) async{
    SingelLessonRepo singelCatgoryRepo = SingelLessonRepo();
    emit(SingelLessonLoading());
    var response = await singelCatgoryRepo.getSingelLessonData(id);
    response.fold(
            (error) {
          emit(SingelLessonError(error));
        },
            (data) {
          emit(SingelLessonSuccess(data));
        }
    );
  }
}
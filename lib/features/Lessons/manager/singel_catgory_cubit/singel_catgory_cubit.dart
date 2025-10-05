import 'package:eazy_app/features/Lessons/manager/singel_catgory_cubit/singel_catgory_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/singel_catgory_repo.dart';
class SingelCatgoryCubit extends Cubit<SingelCatgoryStates>{
  SingelCatgoryCubit() : super(SingelCatgoryInitial());
  static SingelCatgoryCubit get(context) => BlocProvider.of(context);
  void getHomeData({
    required int id
}) async{
    SingelCatgoryRepo singelCatgoryRepo = SingelCatgoryRepo();
    emit(SingelCatgoryLoading());
    var response = await singelCatgoryRepo.getSingelCatgoryData(id);
    response.fold(
            (error) {
          emit(SingelCatgoryError(error));
        },
            (data) {
          emit(SingelCatgorySuccess(data));
        }
    );
  }
}
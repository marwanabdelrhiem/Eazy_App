import 'package:eazy_app/features/other/manager/sitting_cubit/sitting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/repo_sitting.dart';
class SittingCubit extends Cubit<SittingState>{
  SittingCubit():super(SittingInitial());
  static SittingCubit get(context)=>BlocProvider.of(context);
  getSitting()async{
    RepoSitting sittingRepo=RepoSitting();
    emit(SittingLoading());
    var response =await sittingRepo.getSitting();
    response.fold((error) {
      emit(SittingError(error));
    }, (data) {
      emit(SittingSuccess(data));
    });
  }

}

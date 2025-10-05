import 'package:eazy_app/features/splash&onboarding/manager/onbording_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repo/onbording_repo.dart';
class OnBordingCubit2 extends Cubit<OnBordingState2>{
  OnBordingCubit2():super(OnbordingInitial());
  static OnBordingCubit2 get(context)=>BlocProvider.of(context);
  getOnbording()async{
    OnbordingRepo onbordingRepo=OnbordingRepo();
    emit(OnBordingLoading());
    var response =await onbordingRepo.getOnboarding();
    response.fold((error) {
      emit(OnbordingError(error: error));
    }, (data) {
      emit(OnbordingSuccess(data: data));
    });
  }

}


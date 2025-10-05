import 'package:eazy_app/features/home/manager/home_cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/home_repo.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  void getHomeData() async{
    HomeRepo homeRepo = HomeRepo();
    emit(HomeLoading());
   var response = await homeRepo.getHomeData();
   response.fold(
     (error) {
       emit(HomeError(error));
     },
     (data) {
       emit(HomeLoaded(data));
     }
   );
  }
}
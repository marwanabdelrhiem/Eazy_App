import 'package:eazy_app/features/account/view/manager/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/profile_repo.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit():super(ProfileInitial());
  static ProfileCubit get(context)=>BlocProvider.of(context);
  void getProfile()async{
    emit(ProfileLoading());
    ProfileRepo profileRepo = ProfileRepo();
    var response = await profileRepo.getProfile();
    response.fold(
      (error) => emit(ProfileError(
        message: error,
      )),
      (data) => emit(ProfileSuccess(data)),
    );
    
  }
  
}
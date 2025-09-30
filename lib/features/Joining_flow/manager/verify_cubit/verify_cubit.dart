import 'package:eazy_app/features/Joining_flow/data/repos/Auth_repo.dart';
import 'package:eazy_app/features/Joining_flow/manager/verify_cubit/verify_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class VerifyCubit extends Cubit<VerifyState> {
 final authRepo =AuthRepo();
  VerifyCubit() : super(VerifyInitial());
  static VerifyCubit get(context) => BlocProvider.of(context);
  verify({
  required String phone,
})async{
    emit(VerifyLoading());
    var verifyResponse = await authRepo.verify(
      phone: phone,
    );
    verifyResponse.fold(
            (String error)=> emit(VerifyError(error)),
            (message){
          emit(VerifySuccess(message));
        }
    );
  }


}
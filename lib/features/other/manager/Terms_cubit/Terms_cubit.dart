import 'package:eazy_app/features/other/manager/Terms_cubit/Terms_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/Term_repo.dart';
class TermsCubit extends Cubit<TermsState>{
  TermsCubit():super(TermsInitial());
  static TermsCubit get(context)=>BlocProvider.of(context);
  getTerms()async{
    TermRepo termsRepo=TermRepo();
    emit(TermsLoading());
    var response =await termsRepo.getTerms();
    response.fold((error) {
      emit(TermsError(error));
    }, (data) {
      emit(TermsSuccess(data));
    });
  }

}

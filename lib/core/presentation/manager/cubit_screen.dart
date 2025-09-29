import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit_screen_state.dart';

class CubitScreenCubit extends Cubit<CubitScreenState> {
  CubitScreenCubit() : super(CubitScreenInitial());

  Future<void> loadData() async {
    try {
      emit(CubitScreenLoading());

      // هنا تقدر تعمل أي لوجيك (API, Database, إلخ)
      await Future.delayed(const Duration(seconds: 2));

      emit(const CubitScreenLoaded("✅ Data Loaded Successfully"));
    } catch (e) {
      emit(CubitScreenError(e.toString()));
    }
  }
}

import 'package:eazy_app/features/account/view/data/model/profile_model.dart';
import 'package:eazy_app/features/account/view/manager/update_cubit/update_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/model/update_profile_respons.dart';
import '../../data/repo/update_profile_repo.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  XFile? image;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> updateProfile() async {
    if (!formKey.currentState!.validate()) return;

    emit(UpdateProfileLoading());

     UpdateProfileRepo updateProfileRepo = UpdateProfileRepo();
    final updateResponse = await updateProfileRepo.updateProfile(
      name: nameController.text,
      phone: phoneController.text,
      email: emailController.text,
      image: image,
    );

    updateResponse.fold(
          (String error) => emit(UpdateProfileFailure(error)),
          (UpdateProfileResponse response) =>
          emit(UpdateProfileSuccess(response.message)), // نعرض الرسالة فقط
    );
  }

  /// ضبط بيانات الكنترولرز بعد ما نجيبها من Profile API
  void setProfileData(ProfileResponse data) {
    nameController.text = data.data?.name ?? "";
    phoneController.text = data.data?.phone ?? "";
    emailController.text = data.data?.email ?? "";
  }
}

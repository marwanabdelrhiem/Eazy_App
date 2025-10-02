import 'package:eazy/core/data/repo/profile%20repo/profile_remote_data_source.dart';

import '../../model/forget_password_response.dart';
import '../../model/profile_response.dart';
import '../../model/update_password_response.dart';
import '../../model/update_profile_response.dart';
import 'profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remote;

  ProfileRepositoryImpl(this.remote);

  @override
  Future<ProfileResponse> getProfile() async {
    final data = await remote.getProfile();
    return ProfileResponse.fromJson(data);
  }

  @override
  Future<UpdateProfileResponse> updateProfile(Map<String, dynamic> body) async {
    final data = await remote.updateProfile(body);
    return UpdateProfileResponse.fromJson(data);
  }

  @override
  Future<UpdatePasswordResponse> updatePassword(String oldPass, String newPass) async {
    final data = await remote.updatePassword(oldPass, newPass);
    return UpdatePasswordResponse.fromJson(data);
  }

  @override
  Future<ForgetPasswordResponse> forgetPassword(String email) async {
    final data = await remote.forgetPassword(email);
    return ForgetPasswordResponse.fromJson(data);
  }
}

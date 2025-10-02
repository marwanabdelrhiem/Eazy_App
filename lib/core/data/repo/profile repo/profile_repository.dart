
import '../../model/forget_password_response.dart';
import '../../model/profile_response.dart';
import '../../model/update_password_response.dart';
import '../../model/update_profile_response.dart';

abstract class ProfileRepository {
  Future<ProfileResponse> getProfile();
  Future<UpdateProfileResponse> updateProfile(Map<String, dynamic> body);
  Future<UpdatePasswordResponse> updatePassword(String oldPass, String newPass);
  Future<ForgetPasswordResponse> forgetPassword(String email);
}

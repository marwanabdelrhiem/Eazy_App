import '../data/model/profile_model.dart';

abstract class ProfileState{}
class ProfileInitial extends ProfileState{}
class ProfileLoading extends ProfileState{}
class ProfileSuccess extends ProfileState{
  final ProfileResponse profileResponse;
  ProfileSuccess(this.profileResponse);
}
class ProfileError extends ProfileState{
   final String message;

  ProfileError({required this.message});
}
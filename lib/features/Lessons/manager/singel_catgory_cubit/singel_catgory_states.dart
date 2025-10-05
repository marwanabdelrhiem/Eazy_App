import '../../data/models/single_catgory_response.dart';

abstract class SingelCatgoryStates{}
class SingelCatgoryInitial extends SingelCatgoryStates{}
class SingelCatgoryLoading extends SingelCatgoryStates{}
class SingelCatgorySuccess extends SingelCatgoryStates{
  final SingleCatgoryResponse singelCatgoryResponse;
  SingelCatgorySuccess(this.singelCatgoryResponse);
}
class SingelCatgoryError extends SingelCatgoryStates{
  final String message;
  SingelCatgoryError(this.message);
}
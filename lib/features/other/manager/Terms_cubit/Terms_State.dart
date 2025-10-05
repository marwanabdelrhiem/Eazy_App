import '../../data/models/Term_respons.dart' ;
abstract class TermsState{}
class TermsInitial extends TermsState{}
class TermsLoading extends TermsState{}
class TermsSuccess extends TermsState{
  final TermResponse termResponse;
  TermsSuccess(this.termResponse);
}
class TermsError extends TermsState{
  final String message;
  TermsError(this.message);
}
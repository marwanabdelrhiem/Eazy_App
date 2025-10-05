import 'package:eazy_app/features/other/data/models/contact_response.dart';

abstract class ContactState{}
class ContactInitial extends ContactState{}
class ContactLoading extends ContactState{}
class ContactSuccess extends ContactState{
  final contactResponse success;
  ContactSuccess({required this.success});
}
class ContactError extends ContactState{
  final String error;
  ContactError({required this.error});
}
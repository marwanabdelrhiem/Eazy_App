
import 'package:eazy_app/features/other/manager/contact_cubit/contact_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/contact_repo.dart';

class ContactCubit extends Cubit<ContactState> {
  // Controllers
  var nameController = TextEditingController();
  var phoneOrEmailController = TextEditingController();
  var messageController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  static ContactCubit get(context) => BlocProvider.of(context);

  ContactCubit() : super(ContactInitial());

  final ContactRepo contactRepo = ContactRepo();

  void onContact() async {
    if (!formKey.currentState!.validate()) return;
    emit(ContactLoading());

    final combinedTitle = " ${nameController.text} |${phoneOrEmailController.text}";

    var response = await contactRepo.contact(
      title: combinedTitle,
      message: messageController.text,
    );

    response.fold(
          (String error) => emit(ContactError(error: error)),
          (contactResponse) async {
        emit(ContactSuccess(success: contactResponse));
      },
    );
  }
}

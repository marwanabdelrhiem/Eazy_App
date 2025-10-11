import 'package:eazy_app/core/tools//my_navgator.dart';
import 'package:eazy_app/core/utils/appImages.dart';
import 'package:eazy_app/core/utils/appPaddings.dart';
import 'package:eazy_app/core/utils/appStyles.dart';
import 'package:eazy_app/core/widgets/customAppBar.dart';
import 'package:eazy_app/core/widgets/customButtom.dart';
import 'package:eazy_app/core/widgets/textField.dart';
import 'package:eazy_app/features/other/view/widget/social_icons_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/tools//dialog_manager.dart';
import '../../../core/tools//validators.dart';
import '../../../core/utils/appColor.dart';
import '../manager/contact_cubit/contact_cubit.dart';
import '../manager/contact_cubit/contact_state.dart';
import '../manager/sitting_cubit/sitting_cubit.dart';


class ContactUs extends StatelessWidget {
  const ContactUs({super.key});
  void _showAlertDialog(BuildContext context,String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: SizedBox(
            width: 110.w,
            height: 197.h,
            child: Column(
              children: [
                Image.asset(Appimages.Success),
                SizedBox(height: 10,),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyle18w400,
                ),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            CustomBtn(text: "تم", onPressed: () => MyNavigator.goBack(context), width: 298.w, height: 51.h ,)
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider(
  create: (context) => SittingCubit()..getSitting(),
  
),
    BlocProvider(
      create: (context) => ContactCubit(),
    ),
  ],
  child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: AppPaddings.mainPadding,
        child: SingleChildScrollView(
          child: BlocConsumer<ContactCubit, ContactState>(
              listener: (context, state) {
                if (state is ContactSuccess) {
                  _showAlertDialog(context,state.success.message!);
                  ContactCubit.get(context).nameController.clear();
                  ContactCubit.get(context).phoneOrEmailController.clear();
                  ContactCubit.get(context).messageController.clear();
                }
                else if (state is ContactError) {
                  DialogManager.showToast(state.error, AppColors.red);
                }

              },
            builder: (context, state) {
                final cubit = ContactCubit.get(context);
                return Form(
                  key: cubit.formKey,
            child: Column(
              children: [
                SizedBox(height: 8.h,),
               const CustomAppBar(title: "تواصل معانا",),
                SizedBox(height: 79.h,),
                CustomTextField(
                    hintText: "الاسم",
                    controller: cubit.nameController,
                    validator:  Validators.requiredValidator,
                    backgroundColor: AppColors.grey6
                ),
                SizedBox(height: 22.h,),
                CustomTextField(
                    hintText: "رقم الهاتف / البريد الالكتروني",
                    validator:  Validators.requiredValidator,
                    controller: cubit.phoneOrEmailController,
                    backgroundColor: AppColors.grey6),
                SizedBox(height: 22.h,),
                CustomTextField(
                    hintText: "ادخل الملاحظات",
                    controller: cubit.messageController,
                    maxLines: 4,height: 141.h,width: 340.w,
                    backgroundColor: AppColors.grey6,
                    validator:  Validators.requiredValidator
                ),
                SizedBox(height: 46.h,),
                Text(
                  "او تواصل معانا",
                  style: AppStyles.textStyle14w400.copyWith(color: AppColors.black),
                ),

                SizedBox(height: 13.h,),
                SocialIconsRow(),
                SizedBox(height: 120.h,),
                CustomBtn(height: 51.h,width: 340.w,text: "ارسل",
                  onPressed: () {
                    cubit.onContact();
                },),
                SizedBox(height: 20.h,),
              ],
            ),
          );
  },
),
        ),
      ),
    ),
);
  }
}

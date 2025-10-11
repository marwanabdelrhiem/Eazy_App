import 'dart:io';
import 'package:eazy_app/core/tools//validators.dart';
import 'package:eazy_app/core/tools//my_navgator.dart';
import 'package:eazy_app/core/utils/appColor.dart';
import 'package:eazy_app/core/utils/appIcons.dart';
import 'package:eazy_app/core/utils/appImages.dart';
import 'package:eazy_app/core/utils/appStyles.dart';
import 'package:eazy_app/core/widgets/customAppBar.dart';
import 'package:eazy_app/core/widgets/customButtom.dart';
import 'package:eazy_app/core/widgets/customSvg.dart';
import 'package:eazy_app/core/widgets/textField.dart';
import 'package:eazy_app/core/widgets/image_manger/image_manger_view.dart';
import 'package:eazy_app/features/account/view/data/model/profile_model.dart';
import 'package:eazy_app/features/account/view/manager/profile_cubit.dart';
import 'package:eazy_app/features/account/view/manager/update_cubit/update_cubit.dart';
import 'package:eazy_app/features/account/view/manager/update_cubit/update_states.dart';
import 'package:eazy_app/features/password/view/reset_password.dart';
import 'package:eazy_app/features/personal%20details/view/widget/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/tools//dialog_manager.dart';

class PersonalDetails extends StatelessWidget {
  final ProfileResponse data;

  const PersonalDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit()
        ..nameController.text = data.data?.name ?? ""
        ..phoneController.text = data.data?.phone ?? ""
        ..emailController.text = data.data?.email ?? "",
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
          listener: (context, state) {
            if (state is UpdateProfileSuccess) {
              print("✅ Success State Triggered");
              showDialog(
                context: context,
                builder: (dialogContext) {
                  return AlertDialog(
                    title: Center(
                      child: Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: AppStyles.textStyle18w400,
                      ),
                    ),
                    actions: [
                      CustomBtn(
                        text: "تم",
                        height: 48.h,
                        width: 335.w,
                        onPressed: () {
                          ProfileCubit.get(context).getProfile();
                          Navigator.of(dialogContext).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            } else if (state is UpdateProfileFailure) {
              DialogManager.showToast(state.message, AppColors.red);
            }
          },
          builder: (context, state) {
            final cubit = UpdateProfileCubit.get(context);

            return Form(
              key: cubit.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CustomAppBar(title: "البيانات الشخصية"),


                    ImageManagerView(
                      onImagePicked: (image) {
                        cubit.image = image;
                      },
                      imageBuilder: (image) {
                        return CustomImage(
                          image: FileImage(File(image.path)),
                        );
                      },
                      defaultBuilder: CustomImage(
                        image: data.data?.image != null
                            ? NetworkImage(data.data!.image!)
                            : const AssetImage(Appimages.image_person_null)
                        as ImageProvider,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 35),


                    CustomTextField(
                      validator:  Validators.requiredValidator,
                      controller: cubit.nameController,
                      hintText: "الاسم",
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 35),


                    CustomTextField(
                      validator:  Validators.phoneValidator,
                      controller: cubit.phoneController,
                      hintText: "رقم الهاتف",
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 35),


                    CustomTextField(
                      validator:  Validators.emailValidator,
                      controller: cubit.emailController,
                      hintText: "البريد الإلكتروني",
                    ),

                    /// تغيير كلمة المرور
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              MyNavigator.goTo(context, ResetPassword()),
                          child: Text(
                            "تغير كلمه المرور",
                            style: AppStyles.textStyle12w400.copyWith(
                              color: AppColors.firstQus,
                            ),
                          ),

                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 30),
                        CustomSvg(
                          height: 21.h,
                          width: 15.w,
                          path: AppIcons.lock_open,
                          color: AppColors.firstQus,
                        ),
                      ],
                    ),
                    const Spacer(flex: 4),

                    /// زر الحفظ
                    CustomBtn(
                      text: state is UpdateProfileLoading
                          ? "جاري الحفظ..."
                          : "حفظ التعديلات",
                      height: 48.h,
                      width: 335.w,
                      onPressed: () {
                        cubit.updateProfile();
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 25),

                    /// حذف الحساب
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                    top: 16,
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom +
                                        16,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Text("حذف الحساب",
                                              style:
                                              AppStyles.textStyle18w400),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          "هل انت متأكد من انك تريد حذف الحساب؟ سيتم حذف البيانات بشكل كامل",
                                          style: AppStyles.textStyle14w400.copyWith(
                                            color: AppColors.gray,
                                          ),
                                        ),

                                        const SizedBox(height: 16),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CustomBtn(
                                                width: 150.w,
                                                height: 48.h,
                                                text: "تراجع",
                                                colorbut:
                                                AppColors.bottomback,
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: CustomBtn(
                                                width: 150.w,
                                                height: 48.h,
                                                text: "نعم",
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  // هنا هتحط كود الحذف
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            "حذف الحساب",
                            style: AppStyles.textStyle12w400.copyWith(color: AppColors.red),
                          ),

                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 50),
                        CustomSvg(
                          path: AppIcons.deleteIcon,
                          color: AppColors.red,
                          width: 21.w,
                          height: 21.h,
                        ),
                      ],
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

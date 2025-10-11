import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/tools//my_navgator.dart';
import '../../../../core/utils/appColor.dart';
import '../../../../core/utils/appIcons.dart';
import '../../../../core/utils/appImages.dart';
import '../../../../core/utils/appStyles.dart';
import '../../../../core/widgets/CustomSvg.dart';
import '../../../personal details/view/personal_details.dart';
import '../manager/profile_cubit.dart';
import '../manager/profile_state.dart';

class CustomProfile extends StatelessWidget {
  const CustomProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          // 🔹 Shimmer loading widget
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: double.infinity,
              height: 104.h,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // الاسم + تعديل الحساب
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 120.w,
                          height: 16.h,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          width: 80.w,
                          height: 12.h,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  // صورة بليس هولدر
                  Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is ProfileError) {
          return Text(state.message);
        } else if (state is ProfileSuccess) {
          final data = state.profileResponse;
          final String? imageUrl = state.profileResponse.data?.image;
          return Container(
            width: double.infinity,
            height: 104.h,
            color: AppColors.white2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      state.profileResponse.data!.name!,
                      textDirection: TextDirection.rtl,
                      style: AppStyles.textStyle14w400FF,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => MyNavigator.goTo(
                              context,PersonalDetails(
                            data:state.profileResponse,
                          )),
                          child: Text(
                            "تعديل حسابي",
                            style: AppStyles.textStyle12w400FF.copyWith(
                              color: AppColors.blue,
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        CustomSvg(
                          path: AppIcons.writeIcon,
                          width: 12.w,
                          height: 14.h,
                          color: AppColors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 10.w),

                CircleAvatar(
                  radius: 40.r,
                  backgroundImage: (imageUrl != null && imageUrl.isNotEmpty)
                      ? NetworkImage(imageUrl)
                      : const AssetImage(Appimages.image_person_null) as ImageProvider,
                )

              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

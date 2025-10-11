import 'package:eazy_app/core/utils/appColor.dart';
import 'package:eazy_app/core/utils/appPaddings.dart';
import 'package:eazy_app/core/utils/appStyles.dart';
import 'package:eazy_app/core/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../manager/Terms_cubit/Terms_State.dart';
import '../manager/Terms_cubit/Terms_cubit.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TermsCubit()..getTerms(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: AppPaddings.mainPadding,
          child: Column(
            children: [
              SizedBox(height: 8.h),
              const CustomAppBar(title: "الشروط والأحكام"),
              SizedBox(height: 58.h),
              Container(
                width: 355.w,
                height: 498.h,
                decoration: BoxDecoration(color: AppColors.white2),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: BlocBuilder<TermsCubit, TermsState>(
                    builder: (context, state) {
                      if (state is TermsLoading) {
                        // Shimmer أثناء التحميل
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(8, (index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6),
                                child: Container(
                                  height: 14,
                                  width: index % 2 == 0 ? double.infinity : 250,
                                  color: Colors.grey,
                                ),
                              );
                            }),
                          ),
                        );
                      } else if (state is TermsSuccess) {
                        return SingleChildScrollView(
                          child: Text(
                            state.termResponse.data?.content ?? "",
                            style: AppStyles.textStyle12w400.copyWith(height: 2),
                            textDirection: TextDirection.rtl,
                          ),

                        );
                      } else if (state is TermsError) {
                        return Center(child: Text(state.message));
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

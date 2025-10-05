import 'package:eazy_app/features/splash&onboarding/manager/onbording_cubit.dart';
import 'package:eazy_app/features/splash&onboarding/manager/onbording_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'onboardingpage.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBordingCubit2, OnBordingState2>(
      builder: (context, state) {
        if (state is OnBordingLoading) {
          // بدل اللود العادي بخاصية shimmer
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: 20,
                      width: 200,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: 16,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: 16,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is OnbordingError) {
          return Center(
            child: Text(state.error),
          );
        } else if (state is OnbordingSuccess) {
          return OnBoardingPage(
            imagePath: state.data[2].image!,
            title: state.data[2].title!,
            description: state.data[2].content!,
            activeIndex: 2,
            showSkip: true,
          );
        } else {
          return Container();
        }
      },
    );
  }
}

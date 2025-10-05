import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'manager/onbording_cubit.dart';
import 'manager/onbording_state.dart';
import 'onboardingpage.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBordingCubit2, OnBordingState2>(
      builder: (context, state) {
        if(state is OnBordingLoading){
          return  Center(
            child: CircularProgressIndicator(),
          );
        }else if(state is OnbordingError){
          return Center(
            child: Text(state.error),
          );
        }else if(state is OnbordingSuccess){
          return OnBoardingPage(
            imagePath: state.data[1].image!,
            title: state.data[1].title!,
            description: state.data[1].content!,
            activeIndex: 1,
            showSkip: true,
          );
        }else{
          return Container();
        }
      },
    );
  }
}

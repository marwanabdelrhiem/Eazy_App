import 'package:eazy_app/features/Lessons/manager/lesson_cubit/cubit.dart';
import 'package:eazy_app/features/home/manager/tab_cubit.dart';
import 'package:eazy_app/features/splash&onboarding/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/Joining_flow/manager/register_cubit/register_cubit.dart';
import 'features/Joining_flow/manager/verify_cubit/verify_cubit.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  var sharedPref = await SharedPreferences.getInstance();
  var accessToken = sharedPref.getString('access_token');
  runApp(MyApp(
    screen: SplashScreen(
      AccessToken: accessToken),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.screen});
  final Widget screen;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TabCubit()),
        BlocProvider(create: (context) => LessonsCubit()),
        BlocProvider(create: (context)=>RegisterCubit()),
        BlocProvider(create: (context)=>VerifyCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: screen,
          );
        },
      ),
    );
  }
}

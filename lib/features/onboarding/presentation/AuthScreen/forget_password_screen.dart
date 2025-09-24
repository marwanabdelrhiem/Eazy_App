// // File: lib/features/onboarding/presentation/AuthScreen/forget_password_screen.dart
//
// import 'package:flutter/material.dart';
// import 'package:eazy/core/constants/colors.dart';
// import 'package:eazy/core/theme/styles.dart';
// // import 'package:eazy/core/widgets/app_logo.dart'; // لم يعد مستخدماً
// import 'package:eazy/core/routes/app_routes.dart';
//
// // تعريف مؤقت للثوابت المستخدمة لضمان عمل الكود إذا لم تكن موجودة
// const Color kPrimaryColor = Color(0xFF2A72AD);
// const Color kWhiteColor = Colors.white;
// const Color kBlackColor = Colors.black;
// const Color kMediumGrayColor = Color(0xFF8F8F8F);
// const Color kLightGrayColor = Color(0xFFF0F0F0);
// const double kDefaultPadding = 20.0;
// const TextStyle kBodyTextStyle = TextStyle(fontSize: 16);
//
// class ForgetPasswordScreen extends StatelessWidget {
//   const ForgetPasswordScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kWhiteColor, // تغيير الخلفية إلى بيضاء
//       appBar: AppBar(
//         backgroundColor: kWhiteColor,
//         elevation: 0, // إزالة الظل من شريط التطبيق
//         // لإظهار السهم على اليسار (في تصميم RTL)
//         automaticallyImplyLeading: false,
//         actions: [
//           // أيقونة الرجوع (سهم >) ليتناسب مع الاتجاه من اليمين لليسار
//           IconButton(
//             icon: const Icon(Icons.arrow_forward_ios, color: kBlackColor, size: 20),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           const SizedBox(width: 8),
//         ],
//       ),
//       body: Directionality(
//         textDirection: TextDirection.rtl, // تحديد اتجاه النص لليمين لليسار
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const SizedBox(height: 10), // مسافة بعد شريط التطبيق
//
//               // العنوان
//               const Text(
//                 'نسيت كلمة المرور',
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                   fontSize: 24, // زيادة حجم الخط ليتناسب مع التصميم
//                   fontWeight: FontWeight.bold,
//                   color: kBlackColor,
//                 ),
//               ),
//               const SizedBox(height: 8),
//
//               // الوصف
//               const Text(
//                 'أدخل رقم الهاتف / البريد الإلكتروني لاستعادة كلمة المرور',
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: kMediumGrayColor,
//                 ),
//               ),
//               const SizedBox(height: 40),
//
//               // حقل الإدخال
//               TextFormField(
//                 decoration: InputDecoration(
//                   hintText: 'رقم الهاتف / البريد الإلكتروني',
//                   filled: true,
//                   fillColor: kWhiteColor, // تغيير لون الخلفية للحقل إلى أبيض
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(color: kMediumGrayColor, width: 1), // إضافة حدود للحقل
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(color: kMediumGrayColor, width: 1),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(color: kPrimaryColor, width: 2),
//                   ),
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 18,
//                   ),
//                 ),
//                 textAlign: TextAlign.right,
//                 keyboardType: TextInputType.text,
//               ),
//
//               const Spacer(), // لدفع الزر إلى الأسفل
//
//               // زر التأكيد
//               ElevatedButton(
//                 onPressed: () {
//                   // توجيه إلى شاشة OTP لتحديث كلمة المرور
//                   Navigator.of(context).pushNamed(AppRoutes.otpToUpdatePasswordRoute);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: kPrimaryColor,
//                   minimumSize: const Size(double.infinity, 55),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 child: const Text(
//                   'تأكيد',
//                   style: TextStyle(fontSize: 18, color: kWhiteColor, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               const SizedBox(height: 40), // مسافة من أسفل الشاشة
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
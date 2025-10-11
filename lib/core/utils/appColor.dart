import 'dart:ui';

abstract class AppColors {
  static const splash = Color(0xff002A4C); // لون الـ splash
  static const blue = Color(0xff2A72AD); // الأزرق الأساسي
  static const black = Color(0xff141F1F); // الأسود
  static const gray = Color(0xffA4ACAD); // الرمادي
  static const white = Color(0xffFFFFFF); // الأبيض
  static const white2 = Color(0xffF9FAFA); // أبيض فاتح
  static const orange = Color(0xffFF932F); // البرتقالي
  static const gray2 = Color(0xffB5B7BF); // رمادي - زر التخطي
  static const gray3 = Color(0xffB5B7BF); // رمادي - زر (ليس لديك حساب)
  static const gray4 = Color(0xffD2D2D2); // رمادي - زر الشروط والأحكام
  static const grayOtp = Color(0xffE0E0E0); // رمادي - حدود OTP
  static const red = Color(0xffFF0000); // أحمر - خطأ في OTP
  static const arrowBack = Color(0xff141F1F); // لون السهم للخلف
  static const eyePass = Color(0xffC9CECF); // لون العين - كلمة المرور
  static const iconSave = Color(0xffFE9F45); // لون أيقونات الحفظ في الرئيسية
  static const iconlocal = Color(0xffC3C3C3); // لون القفل في الرئيسية
  static const KeyePass = Color(0xffC9CECF); // لون العين - كلمة المرور
  static const bottomback = Color(0xffAFB6B7); // لون زر التراجع السفلي
  static const firstQus = Color(0xff8C8C8C); // لون السؤال الأول
  static const red2 = Color(0xffC63737); // أحمر - شاشة النتائج
  static const signOut = Color(0xffABADAC); // لون تسجيل الخروج
  static const iconCamare = Color(0xff2A72AD); // لون أيقونة الكاميرا
  static const colorUpgrade = Color(0xffFDA958); // لون الترقية
  static const gray5 = Color(0xffE5E5E5); // رمادي فاتح
  static const textHomeSection = Color(0xFF011526); // لون نص قسم الرئيسية
  static const grey6 = Color(0xffE6E9EA); // رمادي جداً فاتح
  static const searchBackground = Color(0xFFF3F3F3); // خلفية البحث
  static const orangeHome = Color(0xFFF9BC66); // برتقالي الرئيسية
  static final grayHome = iconCamare.withValues(alpha: .3); // رمادي الرئيسية بشفافية
  static const containerHome = Color(0xFFF9FAFA); // خلفية الـ container في الرئيسية
  static const progressHome = Color(0xFFE8E8E8); // لون شريط التقدم في الرئيسية
  static const notificationName = Color(0xFF1A201D); // لون اسم الإشعار
}
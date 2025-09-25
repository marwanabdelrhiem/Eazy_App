import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// يجب إزالة هذا الاستيراد إذا لم يعد موجودًا في مسار 'eazy/features/...'
// import 'package:eazy/features/onboarding/presentation/screens/home/account/presentation/screens/forget_password.dart';

// يجب عليك إضافة الاستيرادات التالية لضمان عمل الكود:
import 'package:eazy/core/routes/app_routes.dart';
import 'package:eazy/core/constants/colors.dart';
// قد تحتاج أيضًا إلى استيراد شاشة ForgetPassword إذا لم تكن ضمن المسارات المسماة
// import 'package:eazy/features/auth/presentation/screens/forget_password.dart';


// تعريف مؤقت لشاشة ForgetPassword لتشغيل الكود إذا لم تكن موجودة في المسارات
// يمكنك حذف هذا الكلاس إذا كان لديك استيراد حقيقي له.



class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final List<bool> _isPasswordVisible = [true, true, true];
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _oldPasswordFocusNode = FocusNode();
  final _newPasswordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  void _togglePasswordVisibility(int index) {
    setState(() {
      _isPasswordVisible[index] = !_isPasswordVisible[index];
    });
  }

  // دالة عرض شاشة النجاح المنبثقة (تم نسخها وتعديلها)
  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: const EdgeInsets.all(20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // الأيقونة الثابتة (علامة الصح داخل دائرة - مطابقة للتصميم)
              CircleAvatar(
                radius: 40,
                backgroundColor: kPrimaryColor,
                child: const Icon(
                  Icons.done_rounded, // أيقونة سميكة وناعمة
                  color: kWhiteColor,
                  size: 55,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'تم حفظ التعديلات بنجاح', // تغيير النص ليتناسب مع وظيفة 'حفظ التعديلات'
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kBlackColor,
                ),
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // الانتقال إلى الشاشة الرئيسية (يفترض أن هذا هو المسار المطلوب بعد النجاح)
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.homeRoute,
                        (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'تم',
                  style: TextStyle(fontSize: 18, color: kWhiteColor, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Future<void> _savePassword() async {
    final prefs = await SharedPreferences.getInstance();
    final oldPassword = _oldPasswordController.text;
    final newPassword = _newPasswordController.text;
    final confirmPassword = _confirmPasswordController.text;



    if (newPassword.isEmpty || confirmPassword.isEmpty || oldPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('من فضلك أدخل جميع الحقول.')),
      );
      return;
    }

    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('كلمة المرور الجديدة لا تتطابق مع التأكيد!')),
      );
      return;
    }

    if (newPassword == oldPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('كلمة المرور الجديدة يجب أن تختلف عن القديمة.')),
      );
      return;
    }


    await prefs.setString('password', newPassword);

    // عرض شاشة النجاح بدلاً من SnackBar
    _showSuccessDialog();

    _oldPasswordController.clear();
    _newPasswordController.clear();
    _confirmPasswordController.clear();
  }

  @override
  void initState() {
    super.initState();
    _oldPasswordFocusNode.addListener(() => setState(() {}));
    _newPasswordFocusNode.addListener(() => setState(() {}));
    _confirmPasswordFocusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _oldPasswordFocusNode.dispose();
    _newPasswordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        title: null, // إزالة العنوان
        centerTitle: false,
        automaticallyImplyLeading: false,
        // تغيير أيقونة الرجوع لتصبح سهمًا لليمين ليتناسب مع الـ RTL
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: kBlackColor, size: 20),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: kDefaultPadding / 2),
        ],
      ),
      // تم إضافة SingleChildScrollView للحماية من خطأ الـ Overflow
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                // العنوان الرئيسي: تغيير كلمة المرور
                const Text(
                  'تغيير كلمة المرور',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: kBlackColor,
                  ),
                ),
                const SizedBox(height: 40), // زيادة المسافة

                // حقل كلمة المرور القديمة
                _buildTextField(
                  hintText: 'كلمة المرور القديمة',
                  index: 0,
                  controller: _oldPasswordController,
                  focusNode: _oldPasswordFocusNode,
                ),
                const SizedBox(height: 15),

                // حقل كلمة المرور الجديدة
                _buildTextField(
                  hintText: 'كلمة المرور الجديدة',
                  index: 1,
                  controller: _newPasswordController,
                  focusNode: _newPasswordFocusNode,
                ),
                const SizedBox(height: 15),

                // حقل تأكيد كلمة المرور الجديدة
                _buildTextField(
                  hintText: 'أعد إدخال كلمة المرور الجديدة',
                  index: 2,
                  controller: _confirmPasswordController,
                  focusNode: _confirmPasswordFocusNode,
                ),

                const SizedBox(height: 20),

                // زر نسيت كلمة المرور


                // استخدام SizedBox كفاصل ثابت
                const SizedBox(height: 100),

                // زر حفظ التعديلات
                ElevatedButton(
                  onPressed: _savePassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    minimumSize: const Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'حفظ التعديلات',
                    style: TextStyle(
                      fontSize: 18,
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required int index,
    required TextEditingController controller,
    required FocusNode focusNode,
  }) {
    final borderColor = focusNode.hasFocus ? kPrimaryColor : Colors.grey.shade300;

    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor, // تغيير لون الخلفية ليتطابق مع تصميم حقول الإدخال الجديدة
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: focusNode.hasFocus ? 2 : 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          obscureText: !_isPasswordVisible[index],
          textAlign: TextAlign.right,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: kMediumGrayColor),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 18),
            // تغيير مكان أيقونة إظهار/إخفاء كلمة المرور إلى الـ suffixIcon ليتناسب مع الـ RTL
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible[index] ? Icons.visibility : Icons.visibility_off,
                color: kMediumGrayColor,
              ),
              onPressed: () => _togglePasswordVisibility(index),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eazy/core/routes/app_routes.dart';
import 'package:eazy/core/constants/colors.dart'; // تأكد من استيراد هذا الملف

// يفترض أن الثوابت التالية متاحة عبر الاستيراد:
// kPrimaryColor, kBlackColor, kMediumGrayColor, kWhiteColor, kDefaultPadding

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final List<bool> _isPasswordVisible = [true, true];
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _newPasswordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  void _togglePasswordVisibility(int index) {
    setState(() {
      _isPasswordVisible[index] = !_isPasswordVisible[index];
    });
  }

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
              // الأيقونة الثابتة (علامة الصح داخل دائرة)
              CircleAvatar(
                radius: 40,
                backgroundColor: kPrimaryColor, // اللون الأزرق للدائرة
                child: const Icon(
                  Icons.check_rounded,
                  color: kWhiteColor, // علامة الصح البيضاء
                  size: 50,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'تم حفظ التغييرات بنجاح',
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
                  // الانتقال إلى الشاشة الرئيسية وإزالة جميع المسارات السابقة
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
                  'انتقل للصفحة الرئيسية',
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

  Future<void> _updatePassword() async {
    final newPassword = _newPasswordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('من فضلك أدخل كلمة المرور في كلا الحقلين')),
      );
      return;
    }

    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('كلمة المرور الجديدة لا تتطابق مع التأكيد!')),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', newPassword);

    _showSuccessDialog();

    _newPasswordController.clear();
    _confirmPasswordController.clear();
  }

  @override
  void initState() {
    super.initState();
    _newPasswordFocusNode.addListener(() => setState(() {}));
    _confirmPasswordFocusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
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
        title: null,
        centerTitle: false,
        automaticallyImplyLeading: false,
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
                const Text(
                  'أعد تعيين كلمة المرور',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: kBlackColor,
                  ),
                ),
                const SizedBox(height: 8),

                const Text(
                  'من فضلك أدخل كلمة المرور الجديدة وقم بتأكيدها',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: kMediumGrayColor,
                    fontSize: 16,
                  ),
                ),
                const Text(
                  'كلمة المرور',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: kMediumGrayColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 40),

                _buildTextField(
                  hintText: 'كلمة المرور الجديدة',
                  index: 0,
                  controller: _newPasswordController,
                  focusNode: _newPasswordFocusNode,
                ),
                const SizedBox(height: 15),

                _buildTextField(
                  hintText: 'أعد إدخال كلمة المرور الجديدة',
                  index: 1,
                  controller: _confirmPasswordController,
                  focusNode: _confirmPasswordFocusNode,
                ),

                // استخدام SizedBox كفاصل ثابت بدلاً من Spacer لتجنب الـ Overflow
                const SizedBox(height: 100),

                ElevatedButton(
                  onPressed: _updatePassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    minimumSize: const Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'تحديث كلمة المرور',
                    style: TextStyle(fontSize: 18, color: kWhiteColor, fontWeight: FontWeight.bold),
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
        color: kWhiteColor,
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
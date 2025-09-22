import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final List<bool> _isPasswordVisible = [true, true]; // تم التغيير هنا
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _newPasswordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  void _togglePasswordVisibility(int index) {
    setState(() {
      _isPasswordVisible[index] = !_isPasswordVisible[index];
    });
  }

  Future<void> _updatePassword() async {
    final prefs = await SharedPreferences.getInstance();
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

    await prefs.setString('password', newPassword);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم تحديث كلمة المرور بنجاح!')),
    );

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'أعد تعيين كلمة المرور',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 8.0, bottom: 8.0),
            child: IconButton(
              icon: Image.asset(
                'assets/images/Back.png',
                width: 40,
                height: 40,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'من فضلك أدخل كلمة المرور الجديدة وقم بتأكيد',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
            const Text(
              'كلمة المرور',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
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
            const Spacer(),
            ElevatedButton(
              onPressed: _updatePassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2A72AD),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'تحديث كلمة المرور',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
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
    final borderColor = focusNode.hasFocus ? const Color(0xFF2A72AD) : Colors.grey.shade300;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFA),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        obscureText: !_isPasswordVisible[index],
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          prefixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible[index] ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () => _togglePasswordVisibility(index),
          ),
        ),
      ),
    );
  }
}
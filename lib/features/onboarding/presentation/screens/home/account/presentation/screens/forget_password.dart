import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _emailPhoneController = TextEditingController();
  final _emailPhoneFocusNode = FocusNode();

  void _confirm() {
    final input = _emailPhoneController.text.trim();
    if (input.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('من فضلك أدخل رقم الهاتف أو البريد الإلكتروني')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تم إرسال رابط استعادة إلى $input')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _emailPhoneFocusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _emailPhoneController.dispose();
    _emailPhoneFocusNode.dispose();
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
          'تغيير كلمة المرور',
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
              'ادخل رقم الهاتف / البريد الالكتروني لاستعادة',
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
              hintText: '',
              controller: _emailPhoneController,
              focusNode: _emailPhoneFocusNode,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _confirm,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2A72AD),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'تأكيد',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String hintText, required TextEditingController controller, required FocusNode focusNode}) {
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
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
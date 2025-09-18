// File: lib/features/onboarding/presentation/AuthScreen/otp_to_update_password_screen.dart

import 'package:flutter/material.dart';
import 'package:eazy/core/routes/app_routes.dart';
import 'package:eazy/core/constants/colors.dart';
import 'package:pinput/pinput.dart';
import 'dart:async';

class OtpToUpdatePasswordScreen extends StatefulWidget {
  const OtpToUpdatePasswordScreen({super.key});

  @override
  State<OtpToUpdatePasswordScreen> createState() => _OtpToUpdatePasswordScreenState();
}

class _OtpToUpdatePasswordScreenState extends State<OtpToUpdatePasswordScreen> {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String? _errorMessage;
  bool _isResendActive = false;
  int _resendTimerSeconds = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  @override
  void dispose() {
    _otpController.dispose();
    _focusNode.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startResendTimer() {
    _resendTimerSeconds = 60;
    _isResendActive = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendTimerSeconds == 0) {
        setState(() {
          _isResendActive = true;
          _timer?.cancel();
        });
      } else {
        setState(() {
          _resendTimerSeconds--;
        });
      }
    });
  }

  void _resendCode() {
    print("إعادة إرسال الرمز...");
    _startResendTimer();
    setState(() {
      _errorMessage = null;
      _otpController.clear();
    });
  }

  void _verifyOtp(String otp) {
    if (otp == "1234") {
      setState(() {
        _errorMessage = null;
      });
      // Navigate to the success screen
      Navigator.of(context).pushReplacementNamed(AppRoutes.accountCreatedRoute);
    } else {
      setState(() {
        _errorMessage = "هذا الحقل مطلوب!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: kLightGrayColor,
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: const TextStyle(
        fontSize: 20,
        color: kBlackColor,
        fontWeight: FontWeight.w600,
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: kPrimaryColor),
    );

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: kRedColor, width: 2),
    );

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kBlackColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              'كود التحديث',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: kBlackColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'من فضلك أدخل رمز التحقق الذي أرسل لك في رسالة',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 16,
                color: kMediumGrayColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'على رقم: *** *** *** +218',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 16,
                color: kMediumGrayColor,
              ),
            ),
            const SizedBox(height: 40),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Pinput(
                controller: _otpController,
                focusNode: _focusNode,
                length: 4,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                errorPinTheme: errorPinTheme,
                onCompleted: (pin) => _verifyOtp(pin),
                onChanged: (value) {
                  setState(() {
                    _errorMessage = null;
                  });
                },
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                showCursor: true,
                errorText: _errorMessage,
              ),
            ),
            if (_errorMessage != null) ...[
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: kRedColor, fontSize: 14),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                _verifyOtp(_otpController.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'تأكيد',
                style: TextStyle(fontSize: 18, color: kWhiteColor),
              ),
            ),
            const SizedBox(height: 20),
            if (!_isResendActive)
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'حاول مرة أخرى بعد: 00:${_resendTimerSeconds.toString().padLeft(2, '0')}',
                  style: const TextStyle(color: kMediumGrayColor, fontSize: 14),
                ),
              )
            else
              Center(
                child: TextButton(
                  onPressed: _resendCode,
                  child: const Text(
                    'إعادة إرسال الرمز',
                    style: TextStyle(color: kPrimaryColor, fontSize: 16),
                  ),
                ),
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
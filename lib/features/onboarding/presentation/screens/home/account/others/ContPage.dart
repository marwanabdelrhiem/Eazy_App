import 'package:eazy/core/popup/success_send_message.dart';
import 'package:flutter/material.dart';

class ContPage extends StatefulWidget {
  @override
  _ContPageState createState() => _ContPageState();
}

class _ContPageState extends State<ContPage> {
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _messageController = TextEditingController();

  // دالة لإرسال الرسالة وعرض الـ popup
  void _sendMessage() {
    // التحقق من أن الحقول ليست فارغة
    if (_nameController.text.isEmpty ||
        _contactController.text.isEmpty ||
        _messageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('من فضلك أدخل جميع الحقول.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // هنا ممكن تضيف كود إرسال الرسالة للسيرفر

    // مسح الحقول بعد الإرسال
    _nameController.clear();
    _contactController.clear();
    _messageController.clear();

    // عرض الـ popup
    SuccessSendMessagePopup.show(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    final titleFontSize = screenWidth * (22 / 393);
    final backButtonSize = screenWidth * (40 / 393);

    final fieldWidth = screenWidth * (340 / 393);
    final fieldHeight = screenHeight * (56 / 877);
    final fieldRightPadding = screenWidth * (21 / 393);
    final fieldTopPadding = screenHeight * (19 / 877);
    final fieldFontSize = screenWidth * (16 / 393);

    final bigFieldHeight = screenHeight * (141 / 877);
    final belowTextFontSize = screenWidth * (18 / 393);

    final circleSize = screenWidth * (45 / 393);
    final sideMargin = screenWidth * (73 / 393);
    final logoSpacing = screenWidth * (23 / 393);

    final buttonHeight = screenHeight * (51 / 877);
    final buttonWidth = screenWidth * (340 / 393);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 20,
        ),
        title: Text(
          'تواصل معنا',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),

            // Name Field
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: TextField(
                controller: _nameController, // ← إضافة الـ controller
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: 'الاسم',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                ),
              ),
            ),

            SizedBox(height: 15),

            // Phone/Email Field
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: TextField(
                controller: _contactController, // ← إضافة الـ controller
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: 'رقم الهاتف / البريد الالكتروني',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                ),
              ),
            ),

            SizedBox(height: 15),

            // Message Field
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: TextField(
                controller: _messageController, // ← إضافة الـ controller
                textAlign: TextAlign.right,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: 'اكتب الملاحظات',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                ),
              ),
            ),

            SizedBox(height: 40),

            // Social Media Text
            Text(
              'او تواصل معنا',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),

            SizedBox(height: 20),

            // Social Media Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: sideMargin),
                ClipOval(
                  child: Image.asset(
                    "assets/images/whatsapp.png",
                    width: circleSize,
                    height: circleSize,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: logoSpacing),
                ClipOval(
                  child: Image.asset(
                    "assets/images/facebook.png",
                    width: circleSize,
                    height: circleSize,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: logoSpacing),
                ClipOval(
                  child: Image.asset(
                    "assets/images/instagram.png",
                    width: circleSize,
                    height: circleSize,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: logoSpacing),
                ClipOval(
                  child: Image.asset(
                    "assets/images/twitter.png",
                    width: circleSize,
                    height: circleSize,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            Spacer(),

            // Send Button
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _sendMessage, // ← تغيير هنا لاستدعاء دالة الإرسال
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2E86AB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'إرسال',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// ← إضافة كلاسات الـ popup هنا (أو استدعيها من ملف منفصل)
class SuccessSendMessagePopup {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SuccessSendMessage();
      },
    );
  }
}

class SuccessSendMessage extends StatefulWidget {
  @override
  _SuccessDialogState createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessSendMessage>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _checkController;
  late AnimationController _circleController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _checkAnimation;
  late Animation<double> _circle1Animation;
  late Animation<double> _circle2Animation;
  late Animation<double> _circle3Animation;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _checkController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    _circleController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    );

    _checkAnimation = CurvedAnimation(
      parent: _checkController,
      curve: Curves.easeInOut,
    );

    _circle1Animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _circleController,
      curve: Interval(0.0, 0.6, curve: Curves.easeOut),
    ));

    _circle2Animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _circleController,
      curve: Interval(0.2, 0.8, curve: Curves.easeOut),
    ));

    _circle3Animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _circleController,
      curve: Interval(0.4, 1.0, curve: Curves.easeOut),
    ));

    _startAnimations();
  }

  void _startAnimations() async {
    _scaleController.forward();
    await Future.delayed(Duration(milliseconds: 200));
    _circleController.forward();
    await Future.delayed(Duration(milliseconds: 100));
    _checkController.forward();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _checkController.dispose();
    _circleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 120,
                width: 120,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // الدوائر المتحركة
                    AnimatedBuilder(
                      animation: _circle1Animation,
                      builder: (context, child) {
                        return Positioned(
                          top: 10 + (20 * (1 - _circle1Animation.value)),
                          right: 20 + (30 * (1 - _circle1Animation.value)),
                          child: Opacity(
                            opacity: _circle1Animation.value,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey[400]!,
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    AnimatedBuilder(
                      animation: _circle2Animation,
                      builder: (context, child) {
                        return Positioned(
                          top: 20 + (15 * (1 - _circle2Animation.value)),
                          left: 15 + (25 * (1 - _circle2Animation.value)),
                          child: Opacity(
                            opacity: _circle2Animation.value,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey[300]!,
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    AnimatedBuilder(
                      animation: _circle3Animation,
                      builder: (context, child) {
                        return Positioned(
                          bottom: 15 + (25 * (1 - _circle3Animation.value)),
                          left: 30 + (20 * (1 - _circle3Animation.value)),
                          child: Opacity(
                            opacity: _circle3Animation.value,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.blue[700],
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    // الدائرة الرئيسية مع علامة الصح
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color(0xFF2E86AB), // نفس لون الزر
                        shape: BoxShape.circle,
                      ),
                      child: AnimatedBuilder(
                        animation: _checkAnimation,
                        builder: (context, child) {
                          return CustomPaint(
                            painter: CheckPainter(_checkAnimation.value),
                            size: Size(80, 80),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25),

              Text(
                'تم إرسال الرسالة بنجاح',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 25),

              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2E86AB), // نفس لون الزر الأصلي
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'تم',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

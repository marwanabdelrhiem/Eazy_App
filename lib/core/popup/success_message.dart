import 'package:flutter/material.dart';

class SuccessPopup {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SuccessDialog();
      },
    );
  }
}

class SuccessDialog extends StatefulWidget {
  @override
  _SuccessDialogState createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog>
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

    // Controller للحجم العام
    _scaleController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    // Controller لعلامة الصح
    _checkController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    // Controller للدوائر المتحركة
    _circleController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    // تحديد الـ animations
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

    // بدء الـ animations
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
              // الجزء العلوي مع الأيقونة والدوائر
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
                        color: Colors.blue[600],
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

              // النص
              Text(
                'تم حفظ التعديلات بنجاح',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 25),

              // زر تم
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'تم',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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

// رسام علامة الصح المتحركة
class CheckPainter extends CustomPainter {
  final double animationValue;

  CheckPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);

    // نقاط علامة الصح
    final startPoint = Offset(center.dx - 12, center.dy);
    final middlePoint = Offset(center.dx - 4, center.dy + 8);
    final endPoint = Offset(center.dx + 12, center.dy - 8);

    final path = Path();

    if (animationValue <= 0.5) {
      // رسم الجزء الأول من علامة الصح (من اليسار للوسط)
      final progress = animationValue * 2;
      final currentPoint = Offset.lerp(startPoint, middlePoint, progress);

      path.moveTo(startPoint.dx, startPoint.dy);
      if (currentPoint != null) {
        path.lineTo(currentPoint.dx, currentPoint.dy);
      }
    } else {
      // رسم الجزء الكامل للأول + الجزء الثاني
      final progress = (animationValue - 0.5) * 2;
      final currentPoint = Offset.lerp(middlePoint, endPoint, progress);

      path.moveTo(startPoint.dx, startPoint.dy);
      path.lineTo(middlePoint.dx, middlePoint.dy);
      if (currentPoint != null) {
        path.lineTo(currentPoint.dx, currentPoint.dy);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CheckPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}

// مثال على الاستخدام
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Success Popup Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Success Popup Test'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            SuccessPopup.show(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
          child: Text('إظهار Success Popup'),
        ),
      ),
    );
  }
}
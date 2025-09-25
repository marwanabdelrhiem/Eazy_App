import 'package:flutter/material.dart';

class ContPage extends StatelessWidget {
  @override

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
                onPressed: () {},
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


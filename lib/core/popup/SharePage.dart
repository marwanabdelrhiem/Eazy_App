import 'package:flutter/material.dart';

class IOSSharePopup {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return IOSShareSheet();
      },
    );
  }
}

class IOSShareSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          // الجزء العلوي - AirDrop + تطبيقات المشاركة
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                // AirDrop Section
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 3),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 2),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 1),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              width: 4,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'AirDrop',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Share instantly with people nearby. If they turn on AirDrop from Control Center on iOS or from Finder on the Mac, you\'ll see their names here. Just tap to share.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Divider(height: 1, color: Colors.grey[300]),

                // تطبيقات المشاركة
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildShareOption(
                        context,
                        'Message',
                        _buildMessageIcon(),
                            () => Navigator.pop(context),
                      ),
                      _buildShareOption(
                        context,
                        'Mail',
                        _buildMailIcon(),
                            () => Navigator.pop(context),
                      ),
                      _buildShareOption(
                        context,
                        'Twitter',
                        _buildTwitterIcon(),
                            () => Navigator.pop(context),
                      ),
                      _buildShareOption(
                        context,
                        'Facebook',
                        _buildFacebookIcon(),
                            () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),

          // الجزء السفلي - الإجراءات
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionOptionRow(
                  context,
                  'Copy',
                  Icons.content_copy,
                      () => Navigator.pop(context),
                ),
                _buildActionOptionRow(
                  context,
                  'Lock Note',
                  Icons.lock,
                      () => Navigator.pop(context),
                ),
                _buildActionOptionRow(
                  context,
                  'Print',
                  Icons.print,
                      () => Navigator.pop(context),
                ),
                _buildActionOptionRow(
                  context,
                  'More',
                  Icons.more_horiz,
                      () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),

          // زر الإلغاء
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFFF9500),
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 18),
              ),
            ),
          ),

          // مساحة للـ safe area
          SizedBox(height: MediaQuery.of(context).padding.bottom + 10),
        ],
      ),
    );
  }

  Widget _buildShareOption(BuildContext context, String title, Widget icon,
      VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: icon,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionOptionRow(BuildContext context, String title, IconData icon,
      VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 25,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionOption(BuildContext context, String title, IconData icon,
      VoidCallback onTap) {
    return ListTile(
      leading: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: Colors.grey[600],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    );
  }

  // أيقونات التطبيقات الملونة
  Widget _buildMessageIcon() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xFF34C759),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        Icons.message_rounded,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  Widget _buildMailIcon() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xFF007AFF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        Icons.mail,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  Widget _buildTwitterIcon() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xFF1DA1F2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        Icons.alternate_email,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  Widget _buildFacebookIcon() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xFF1877F2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        Icons.facebook,
        color: Colors.white,
        size: 30,
      ),
      alignment: Alignment.center,
    );
  }
}


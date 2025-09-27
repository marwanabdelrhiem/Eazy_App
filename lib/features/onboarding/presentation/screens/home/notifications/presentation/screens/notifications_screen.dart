import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, String>> notifications;
  const NotificationsScreen({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    //-------------------------App Bar---------------------------//

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'الإشعارات',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),

      body: notifications.isEmpty
          ? _buildEmptyState()
          : _buildNotificationsList(),
    );
  }

  //-------------------------Empty Notifications---------------------------//

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Group.png',
            width: 95.71,
            height: 108,
          ),
          const SizedBox(height: 16),
          const Text(
            'ليس لديك إشعارات جديدة حتى الآن',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFFC3C3C3),
            ),
          ),
        ],
      ),
    );
  }

  //-------------------------Notifications---------------------------//

  Widget _buildNotificationsList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal:16, vertical:12),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notif = notifications[index];
        return Container(
          width: 359,
          height: 112,
          margin: const EdgeInsets.only(bottom: 12),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              //-------------------------Notifications Card---------------------------//
              Container(
                width: double.infinity,
                height: 112,
                padding: const EdgeInsets.symmetric(horizontal:18),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Container(
                          width: 64.85,
                          height: 64.85,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD1D5DB),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/bill.png',
                              height: 28.29,
                              width: 28.29,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),

                        //-------------------------Notifications Body---------------------------//

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notif['title'] ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                notif['body'] ?? '',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              if (index == 0)
                Positioned(
                  right: -15,
                  top: (112 / 2) - 5,
                  child: const CircleAvatar(
                    radius: 5,
                    backgroundColor: Color(0xFFFF932F),
                  ),
                ),

            ],
          ),
        );
      },
    );
  }
}

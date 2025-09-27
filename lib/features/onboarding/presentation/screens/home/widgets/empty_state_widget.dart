import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //-------------------------Empty Lesson ---------------------------//

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.assignment_outlined,
            size: 100,
            color: Colors.grey[400],
          ),
          SizedBox(height: 20),
          Text(
            'ليس لديك منهجيات جديدة حتى الآن',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
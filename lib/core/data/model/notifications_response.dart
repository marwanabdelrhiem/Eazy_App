class NotificationsResponse {
  final bool status;
  final String message;
  final List<NotificationData> data;

  NotificationsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) {
    return NotificationsResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => NotificationData.fromJson(e))
          .toList(),
    );
  }
}

class NotificationData {
  final int id;
  final String title;
  final String body;

  NotificationData({
    required this.id,
    required this.title,
    required this.body,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }
}

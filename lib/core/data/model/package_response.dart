import 'package.dart';

class PackageResponse {
  final bool status;
  final String message;
  final List<PackageData> data;

  PackageResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PackageResponse.fromJson(Map<String, dynamic> json) {
    return PackageResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => PackageData.fromJson(e))
          .toList(),
    );
  }
}
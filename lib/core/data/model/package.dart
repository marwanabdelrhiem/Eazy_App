class PackageData {
  final int id;
  final String name;
  final double price;
  final String duration;

  PackageData({
    required this.id,
    required this.name,
    required this.price,
    required this.duration,
  });

  factory PackageData.fromJson(Map<String, dynamic> json) {
    return PackageData(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : (json['price'] ?? 0.0),
      duration: json['duration'] ?? '',
    );
  }
}
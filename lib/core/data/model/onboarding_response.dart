import 'onboarding_item.dart';

class OnboardingResponse {
  final List<OnboardingItem> data;

  OnboardingResponse({required this.data});

  factory OnboardingResponse.fromJson(Map<String, dynamic> json) {
    return OnboardingResponse(
      data: (json['data'] as List)
          .map((i) => OnboardingItem.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
  }
}
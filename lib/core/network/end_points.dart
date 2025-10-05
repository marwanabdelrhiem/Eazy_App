abstract class EndPoints
{
  static const String ecoBaseUrl ='https://easy.syntecheg.com/api/';
  static const String login = 'login';
  static const String register = 'register';
  static const String otp = 'otp';
  static const String verify = 'verify';
  static const String onbording = 'onboarding';
  static const String terms= 'terms';
  static const String setting = 'setting';
  static const String contact = 'contact';
  static const String home = 'home';
  static const String profile = 'profile';
  static const String password = 'password';
  static String catgory({
    required int id,
  }) {
    return 'category/$id';
  }
  static String lesson({
    required int id,
  }) {
    return 'lesson/$id';
  }








}
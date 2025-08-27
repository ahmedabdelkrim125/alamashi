class EndPoints {
  static const String baseUrl = 'https://alamashi-api.onrender.com/api';

  // 🔑 Authentication
  static const String login = '$baseUrl/Users/login';
  static const String createNewUser = '$baseUrl/Users/Create';
  static const String refresh = '$baseUrl/Users/refresh';

  // 👥 Users
  static const String getAllUsers = '$baseUrl/Users/All';
  static String userByID(int userID) => '$baseUrl/Users/$userID';
}

class ApiKeys {
  // 📌 Response Keys
  static const String status = 'status';
  static const String data = 'data';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';

  // 🧑‍💻 User Keys
  static const String userId = 'userID';
  static const String userName = 'userName';
  static const String email = 'email';
  static const String password= 'password';
  static const String phone = 'phone';
  static const String permissions = 'permissions';
  static const String user = 'user';

  // 📌 Error Keys
  static const String statusCode = 'statusCode';
  static const String errorMessage = 'message';
}

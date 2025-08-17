class EndPoints {
  static const String baseUrl = 'https://alamashi-api.onrender.com/api';

  // 🔑 Authentication
  static const String login = '$baseUrl/Users/login';
  static const String createNewUser = '$baseUrl/Users/Create';

  // 👥 Users
  static const String getAllUsers = '$baseUrl/Users/All';
  static String userByID(int userID) => '$baseUrl/Users/$userID';
}

class ApiKeys {
  // 🔢 Response Keys
  static const String statusCode = 'statusCode';
  static const String errorMessage = 'message';

  // 🧑‍💻 User Keys
  static const String email = 'email';
  static const String password = 'password';
  static const String token = 'token';
  static const String id = 'id';
}

class EndPoints {
  // Base URL
  static const String baseUrl = 'https://alamashi.runasp.net';

  // Authentication Endpoints
  static const String login = '/api/Users/login';
  static const String register = '/api/Users/register';  
  static const String refresh = '/api/Users/refresh';

  // Users Endpoints
  static const String getAllUsers = '/api/Users/all';
  static String userByID(int userID) => '/api/Users/$userID';

  // Products
  static const String products = '/api/Products';
  static String productByID(int id) => '/api/Products/$id';
}

class ApiKeys {
  // Response Keys
  static const String status = 'status';
  static const String data = 'data';
  static const String message = 'message';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';
  static const String response = 'response';

  // User Keys
  static const String userId = 'userID';
  static const String userName = 'userName';
  static const String email = 'email';
  static const String password = 'password';
  static const String phone = 'phone';
  static const String permissions = 'permissions';
  static const String user = 'user';

  // Error Keys
  static const String statusCode = 'statusCode';
  static const String errorMessage = 'message';

  // JWT Claims
  static const String jwtRole = "http://schemas.microsoft.com/ws/2008/06/identity/claims/role";
  static const String jwtNameIdentifier = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier";
  static const String jwtName = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name";  
  static const String jwtEmail = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress";  
}
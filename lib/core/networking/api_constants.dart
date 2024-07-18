class ApiConstants {
 // static const String apiBaseUrl = "https://reqres.in/api/";
  static const String apiBaseUrl = "https://dummyjson.com/";

  static const String login = "auth/login";
//  static const String login = "login";
  static const String users = "users";
 // static const String users = "users?page={page}";
  static const String todosId = "todos?{id}";
  static const String todos = "todos?";
  static const String todosByUserId = "todos/user/{id}";
  static const String todosById = "todos/{id}";

  static const String addTodo='add';
  static const String updateTodo='add';
  static const String deleteTodo='add';

  //api/users?page
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}


class UserExistsException implements Exception{
   String? message;
  Exception? exception;
  UserExistsException({
    this.message,
    this.exception,
  });


  @override
  String toString() => 'UserExistsException(message: $message, exception: $exception)';
}

class UserNotFoundException implements Exception{
   String? message;
  
  UserNotFoundException({
    this.message,
    
  });


  @override
  String toString() => 'UserExistsException(message: $message,)';
}
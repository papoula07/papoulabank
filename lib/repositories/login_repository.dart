class LoginRepository{
  Future<void> login()async{
    await Future.delayed(Duration(seconds: 3));
  }
}
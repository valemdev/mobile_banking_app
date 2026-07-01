class LoginDataSource {
  Future<String> login(email, password) async {
    await Future.delayed(const Duration(seconds: 6));
    if(email == 'pablovas@gmail.com' && password == '123456'){
    const mockToken =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6ImExYTk2YzNmMjdlODI0MjZmYjRjMjRjZDg4NDE4YzBlIn0.eyJzdWIiOiJwYWJsb3ZhcyJ9.4Rr-R1NxkSBiMn98PomoiGp3TqrokUSzgaKTApCFu-g9jLrtWC5CsTb9_BUV4EsoVygJYSWOQ9bRBnC7BtHj_A';
        return mockToken;
    } else {
      throw Exception('Invalid credentials');
    }
  }
}

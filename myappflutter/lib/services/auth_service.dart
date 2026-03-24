class AuthService {
  Future<bool> login(String email, String senha) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email.isNotEmpty && senha.isNotEmpty) {
      return true;
    }

    return false;
  }
}
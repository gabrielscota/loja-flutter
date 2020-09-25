class AuthException implements Exception {
  static const Map<String, String> errors = {
    'EMAIL_EXISTS': 'Este email já está em uso!',
    'OPERATION_NOT_ALLOWED': 'Login por senha está desabilitado nesse projeto!',
    'TOO_MANY_ATTEMPTS_TRY_LATER':
        'Bloqueado por atividade incomum, muitas tentativas de login!',
    'EMAIL_NOT_FOUND':
        'Email não foi encontrado!',
    'INVALID_PASSWORD':
        'Senha inválida!',
    'USER_DISABLED': 'Esse usuário foi desativado por um administrador!',
  };

  final String key;

  const AuthException(this.key);

  @override
  String toString() {
    if (errors.containsKey(key)) {
      return errors[key];
    } else {
      return 'Ocorreu um erro na autenticação!';
    }
  }
}

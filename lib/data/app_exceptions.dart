class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(
          message,
          'Error During Communication',
        );
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

class UnAuthorizedException extends AppExceptions {
  UnAuthorizedException([String? message])
      : super(message, 'UnAuthorize Request');
}

class InValidInputException extends AppExceptions{
  InValidInputException([String? message])
      : super(message, 'InValidInput Request');
}

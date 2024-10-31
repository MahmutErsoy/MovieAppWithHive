enum ExceptionType {
  requestCancelled,
  requestTimeout,
  noInternetConnection,
  timeout,
  internalServerError,
  unknownError,
  badCertificate,
  badResponse,
  connectionError,
  formatException
}

extension ExceptionTypeExtension on ExceptionType {
  String message() {
    switch (this) {
      case ExceptionType.requestCancelled:
        return ('İstek iptal edildi!');

      case ExceptionType.requestTimeout:
        return ('İstek zamanaşımına uğradı!');

      case ExceptionType.noInternetConnection:
        return ('İnternet bağlantısı bulunamadı. Uygulamayı kullanabilmeniz için internete ihtiyacınız vardır!');

      case ExceptionType.timeout:
        return ('Zaman aşımı hatası. Lütfen daha sonra tekrar deneyiniz!');

      case ExceptionType.internalServerError:
        return ('Sunucu hatası oluştu. Lütfen daha sonra tekrar deneyiniz!');
      case ExceptionType.badCertificate:
        return ('Kötü istek, Lütfen daha sonra tekrar deneyiniz!');
      case ExceptionType.badResponse:
        return ('Kötü cevap, Lütfen daha sonra tekrar deneyiniz!');
      case ExceptionType.connectionError:
        return ('Sunucuya bağlanırken bir hata oluştu. Lütfen daha sonra tekrar deneyiniz!');
      case ExceptionType.unknownError:
        return ('Bilinmeyen bir hata oluştu. Lütfen daha sonra tekrar deneyiniz!');

      case ExceptionType.formatException:
        return ('formatException!');
    }
  }
}
enum CookieContentType {
  jsonContentType,
  formUrlEncodedContentType,
  textPlainContentType,
  multipartFormDataContentType;

  String get value {
    switch (this) {
      case CookieContentType.jsonContentType:
        return 'application/json';

      case CookieContentType.formUrlEncodedContentType:
        return 'application/x-www-form-urlencoded';

      case CookieContentType.textPlainContentType:
        return 'text/plain';

      case CookieContentType.multipartFormDataContentType:
        return 'multipart/form-data';
    }
  }
}

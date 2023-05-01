class CookieLogger {
  const CookieLogger({
    this.showLogger = true,
    this.requestHeader = false,
    this.request = true,
    this.requestBody = false,
    this.responseHeader = false,
    this.responseBody = true,
  });

  final bool showLogger;
  final bool requestHeader;
  final bool request;
  final bool requestBody;
  final bool responseHeader;
  final bool responseBody;
}

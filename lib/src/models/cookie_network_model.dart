abstract class CookieNetworkModel<T> {
  const CookieNetworkModel();

  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}

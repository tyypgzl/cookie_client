/// The Http Client package that depends on the dio package.
library cookie_client;

export 'src/cookie_client.dart';
export 'src/enums/content_type.dart';
export 'src/enums/failure_type.dart';
export 'src/enums/http_method_enum.dart';
export 'src/handler/cookie_handler.dart';
export 'src/models/cookie_failure.dart';
export 'src/models/cookie_inspector.dart';
export 'src/models/cookie_logger.dart';
export 'src/models/cookie_network_model.dart';
export 'src/models/failures.dart';

// TODO(tyypgzl): Add chucker_flutter and feedback package
// Kendi inspectorunu ve loggerini yaz. Cookie client cookie logger gibi.

// TODO(tyypgzl): cache interceptor
// TODO(tyypgzl): add all http error codes 100-200-300-400-500

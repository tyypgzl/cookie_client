import 'package:cookie_client/cookie_client.dart';
import 'package:example/api/valorant_api.dart';
import 'package:example/enums/api_requirements_enum.dart';
import 'package:example/model/agent_response.dart';

abstract class IValorantService {
  Future<AgentResponse> getAgent(String agentUuid);
}

class ValorantService extends IValorantService {
  ValorantService() {
    _valorantApi = ValorantApi(
      CookieClient(baseUrl: ApiRequirements.baseUrl.value),
    );
  }

  late final ValorantApi _valorantApi;

  @override
  Future<AgentResponse> getAgent(String agentUuid) {
    return _valorantApi.getAgent(agentUuid);
  }
}

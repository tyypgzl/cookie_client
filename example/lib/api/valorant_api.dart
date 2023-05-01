import 'package:cookie_client/cookie_client.dart';
import 'package:example/enums/api_requirements_enum.dart';
import 'package:example/model/agent_response.dart';

class ValorantApi {
  ValorantApi(CookieClient client) : _client = client;

  late final CookieClient _client;

  Future<AgentResponse> getAgent(String agentUuid) async {
    final agent = await _client.get<AgentResponse, AgentResponse>(
      '${ApiRequirements.agents.value}/$agentUuid',
      responseModel: AgentResponse(),
    );
    return agent;
  }
}

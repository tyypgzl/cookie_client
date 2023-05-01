import 'package:cookie_client/cookie_client.dart';
import 'package:example/model/agent.dart';

class AgentResponse extends CookieNetworkModel<AgentResponse> {
  int? status;
  Agent? agent;

  AgentResponse({this.status, this.agent});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    if (agent != null) {
      data['data'] = agent!.toJson();
    }
    return data;
  }

  @override
  AgentResponse fromJson(Map<String, dynamic> json) => AgentResponse(
        status: json['status'],
        agent: json['data'] != null ? Agent.fromJson(json['data']) : null,
      );
}

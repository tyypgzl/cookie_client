import 'package:example/enums/api_requirements_enum.dart';
import 'package:example/model/agent_response.dart';
import 'package:example/service/valorant_service.dart';
import 'package:flutter/material.dart';

@immutable
class CookieView extends StatefulWidget {
  const CookieView({super.key});

  @override
  State<CookieView> createState() => _CookieViewState();
}

class _CookieViewState extends State<CookieView> {
  final service = ValorantService();
  AgentResponse? agentResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Valorant View'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () async {
              final result =
                  await service.getAgent(ApiRequirements.fadeUuid.value);
              setState(() {
                agentResponse = result;
              });
            },
            child: const Text('GET'),
          ),
          ListTile(
            title: Text(agentResponse?.agent?.displayName ?? 'Loading Name'),
            leading: CircleAvatar(
              radius: 28,
              child: agentResponse?.agent?.displayIcon != null
                  ? Image.network(agentResponse!.agent!.displayIcon ?? '')
                  : const CircularProgressIndicator(),
            ),
            subtitle: Text(agentResponse?.agent?.description ?? 'Loading Description'),
          ),
        ],
      ),
    );
  }
}

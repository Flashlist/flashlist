import 'package:flutter/material.dart';

import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/features/users/presentation/connections/connection_request_input.dart';
import 'package:flashlist_flutter/src/features/users/presentation/connections/existing_connections.dart';
import 'package:flashlist_flutter/src/features/users/presentation/connections/pending_connection_requests.dart';

class ConnectionsWidget extends StatelessWidget {
  /// Widget for managing connections.
  /// Holds the input for sending a connection request,
  /// the list of pending requests and the list of existing connections.
  const ConnectionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.p16),
      child: Column(
        children: [
          ConnectionRequestInput(),
          gapH12,
          PendingConnectionRequests(),
          gapH12,
          ExistingConnections(),
        ],
      ),
    );
  }
}

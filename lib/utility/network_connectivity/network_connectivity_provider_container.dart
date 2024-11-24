// Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:

part 'network_connectivity_provider_container.g.dart';

@riverpod
Connectivity connectivity(Ref ref) {
  return Connectivity();
}

@riverpod
NetworkConnectivity networkConnectivity(
  Ref ref,
) {
  final _connectivityProvider = ref.read(connectivityProvider);
  return NetworkConnectivity(connectivity: _connectivityProvider);
}

class NetworkConnectivity {
  final Connectivity connectivity;

  NetworkConnectivity({required this.connectivity});

  /*Check Network Connection*/
  Future<bool> checkNetwork() async {
    final connectivityResult = await connectivity.checkConnectivity();
    return networkStatus(connectivityResult);
  }

  /*Return status for connection result*/
  bool networkStatus(List<ConnectivityResult> connectivityResult) {
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    } else {
      return false;
    }
  }
}

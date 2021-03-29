import 'package:connectivity/connectivity.dart';

Future<bool> isNetworkConnected() async {
  final connectivity = await (Connectivity().checkConnectivity());
  switch (connectivity) {
    case ConnectivityResult.mobile:
    case ConnectivityResult.wifi:
      return true;
    default:
      return false;
  }
}

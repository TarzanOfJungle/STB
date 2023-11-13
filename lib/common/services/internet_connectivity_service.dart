import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rxdart/rxdart.dart';

class InternetConnectivityService {
  final Connectivity _connectivity;

  final BehaviorSubject<bool> _isConnected = BehaviorSubject();

  Stream<bool> get isConnectedToInternetStream => _isConnected.stream;
  bool get isConnectedToInternet => _isConnected.value;

  InternetConnectivityService(this._connectivity) {
    _connectivity.onConnectivityChanged.listen((connResult) {
      final isConnected = connResult != ConnectivityResult.none;
      _isConnected.add(isConnected);
    });
  }
}

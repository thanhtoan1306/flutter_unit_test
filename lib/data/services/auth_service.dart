// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

class AuthService extends GetxService {
  final _authEvent = Rx<AuthEvent?>(null);

  Stream<AuthEvent?> get authEventStream => _authEvent.stream;
}

enum AuthEventType { CODE_SENT, VALIDATED, ERROR, TIMEOUT }

class AuthEvent {
  AuthEventType eventType;
  String? message;
  AuthEvent({required this.eventType, this.message});
}

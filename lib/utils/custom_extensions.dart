import 'package:flutter/material.dart';

import '../barrel/utils.dart';

extension ExtSizedBox on int {
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());
}

extension ExtAuthStatus on AuthStatus {
  bool get isInitial => this == AuthStatus.initial;
  bool get isAuthorized => this == AuthStatus.authorized;
  bool get isUnauthorized => this == AuthStatus.unauthorized;
  bool get hasFailed => this == AuthStatus.failure;
}
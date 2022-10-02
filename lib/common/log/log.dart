import 'package:flutter/foundation.dart';

appLog(var data) {
  if (kDebugMode) {
    print(data.toString());
  }
}

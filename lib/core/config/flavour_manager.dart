import 'dart:convert';

import 'package:flutter/services.dart';

import '../../flavors.dart';
import 'environment.dart';

class FlavourManager {
  static Environment? env;

  Future<FlavourManager> init(Flavor flavour) async {
    F.appFlavor = flavour;
    final configFile = await rootBundle.loadString(F.envFileName);
    env = Environment.fromJson(json.decode(configFile) as Map<String, dynamic>);
    return this;
  }
}

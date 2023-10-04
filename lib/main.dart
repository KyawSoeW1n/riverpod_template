import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'core/config/flavour_manager.dart';
import 'data_model/cache/cache_post.dart';
import 'data_source/local/app_database.dart';
import 'flavors.dart';


FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await FlavourManager().init(Flavor.production);
  await Hive.initFlutter();
  Hive.registerAdapter(CachePostAdapter());

  final dbService = DatabaseService();
  await dbService.initTheme();
  await dbService.initPostBox();
  await dbService.initLanguageBox();
  await dbService.initUserDataBox();
  runApp(
    ProviderScope(
      overrides: [
        databaseService.overrideWith((_) => dbService),
      ],
      child: const MyApp(),
    ),
  );
}
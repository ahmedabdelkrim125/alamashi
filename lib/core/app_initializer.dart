import 'dart:developer';
import 'package:egyptian_supermaekat/core/di/injection.dart';
import 'package:egyptian_supermaekat/core/utils/cache_helper.dart';
import 'package:egyptian_supermaekat/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppInitializer {
  static Future<void> initialize() async {
    try {
      log('Starting app initialization...');

      await _initializeCache();
      await _loadEnvironmentVariables();
      await _initializeFirebase();
      await _initializeDependencies();

      log('Initialization completed successfully!');
    } catch (e, stack) {
      log('Initialization failed: $e');
      log(stack.toString());
      rethrow;
    }
  }

  static Future<void> _initializeCache() async {
    await CacheHelper.init();
  }

  static Future<void> _loadEnvironmentVariables() async {
    try {
      await dotenv.load(fileName: ".env");
    } catch (e) {
      if (kDebugMode) log('No .env file found, using defaults.');
    }
  }

  static Future<void> _initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static Future<void> _initializeDependencies() async {
    await setupInjection();
  }
}

/*
 * Copyright (c) 2019-2021 Taner Sener
 *
 * This file is part of FFmpegKit.
 *
 * FFmpegKit is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * FFmpegKit is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with FFmpegKit.  If not, see <http://www.gnu.org/licenses/>.
 */

import 'package:ffmpeg_kit_platform_interface/ffmpeg_kit_platform_interface.dart';
import 'package:flutter/services.dart';

import 'execute_callback.dart';
import 'ffmpeg_session.dart';
import 'ffprobe_session.dart';
import 'level.dart';
import 'log_callback.dart';
import 'log_redirection_strategy.dart';
import 'media_information_session.dart';
import 'session.dart';
import 'session_state.dart';
import 'src/ffmpeg_kit_factory.dart';
import 'src/ffmpeg_kit_flutter_initializer.dart';
import 'statistics_callback.dart';

class FFmpegKitConfig {
  static FFmpegKitPlatform _platform = FFmpegKitPlatform.instance;

  static LogRedirectionStrategy _globalLogRedirectionStrategy =
      LogRedirectionStrategy.printLogsWhenNoCallbacksDefined;

  static int _activeLogLevel = Level.avLogTrace;

  static Future<void> init() async {
    await FFmpegKitInitializer.initialize();
  }

  static Future<void> enableRedirection() async {
    try {
      await init();
      return _platform.ffmpegKitConfigEnableRedirection();
    } on PlatformException catch (e, stack) {
      print("Plugin enableRedirection error: ${e.message}");
      return Future.error("enableRedirection failed.", stack);
    }
  }

  static Future<void> disableRedirection() async {
    try {
      await init();
      return _platform.ffmpegKitConfigDisableRedirection();
    } on PlatformException catch (e, stack) {
      print("Plugin disableRedirection error: ${e.message}");
      return Future.error("disableRedirection failed.", stack);
    }
  }

  static Future<void> setFontconfigConfigurationPath(String path) async {
    try {
      await init();
      return _platform.ffmpegKitConfigSetFontconfigConfigurationPath(path);
    } on PlatformException catch (e, stack) {
      print("Plugin setFontconfigConfigurationPath error: ${e.message}");
      return Future.error("setFontconfigConfigurationPath failed.", stack);
    }
  }

  static Future<void> setFontDirectory(String path,
      [Map<String, String>? mapping = null]) async {
    try {
      await init();
      return _platform.ffmpegKitConfigSetFontDirectory(path, mapping);
    } on PlatformException catch (e, stack) {
      print("Plugin setFontDirectory error: ${e.message}");
      return Future.error("setFontDirectory failed.", stack);
    }
  }

  static Future<void> setFontDirectoryList(List<String> fontDirectoryList,
      [Map<String, String>? mapping = null]) async {
    try {
      await init();
      return _platform.ffmpegKitConfigSetFontDirectoryList(
          fontDirectoryList, mapping);
    } on PlatformException catch (e, stack) {
      print("Plugin setFontDirectoryList error: ${e.message}");
      return Future.error("setFontDirectoryList failed.", stack);
    }
  }

  static Future<String?> registerNewFFmpegPipe() async {
    try {
      await init();
      return _platform.ffmpegKitConfigRegisterNewFFmpegPipe();
    } on PlatformException catch (e, stack) {
      print("Plugin registerNewFFmpegPipe error: ${e.message}");
      return Future.error("registerNewFFmpegPipe failed.", stack);
    }
  }

  static Future<void> closeFFmpegPipe(String ffmpegPipePath) async {
    try {
      await init();
      return _platform.ffmpegKitConfigCloseFFmpegPipe(ffmpegPipePath);
    } on PlatformException catch (e, stack) {
      print("Plugin closeFFmpegPipe error: ${e.message}");
      return Future.error("closeFFmpegPipe failed.", stack);
    }
  }

  static Future<String?> getFFmpegVersion() async {
    try {
      await init();
      return _platform.ffmpegKitConfigGetFFmpegVersion();
    } on PlatformException catch (e, stack) {
      print("Plugin getFFmpegVersion error: ${e.message}");
      return Future.error("getFFmpegVersion failed.", stack);
    }
  }

  static Future<String> getVersion() async => FFmpegKitFactory.getVersion();

  static Future<bool?> isLTSBuild() async {
    try {
      await init();
      return _platform.ffmpegKitConfigIsLTSBuild();
    } on PlatformException catch (e, stack) {
      print("Plugin isLTSBuild error: ${e.message}");
      return Future.error("isLTSBuild failed.", stack);
    }
  }

  static Future<String?> getBuildDate() async {
    try {
      await init();
      return _platform.ffmpegKitConfigGetBuildDate();
    } on PlatformException catch (e, stack) {
      print("Plugin getBuildDate error: ${e.message}");
      return Future.error("getBuildDate failed.", stack);
    }
  }

  static Future<void> setEnvironmentVariable(String name, String value) async {
    try {
      await init();
      return _platform.ffmpegKitConfigSetEnvironmentVariable(name, value);
    } on PlatformException catch (e, stack) {
      print("Plugin setEnvironmentVariable error: ${e.message}");
      return Future.error("setEnvironmentVariable failed.", stack);
    }
  }

  static Future<void> ignoreSignal(int signal) async {
    try {
      await init();
      return _platform.ffmpegKitConfigIgnoreSignal(signal);
    } on PlatformException catch (e, stack) {
      print("Plugin ignoreSignal error: ${e.message}");
      return Future.error("ignoreSignal failed.", stack);
    }
  }

  static Future<void> asyncFFmpegExecute(FFmpegSession ffmpegSession) async {
    try {
      await init();
      return _platform
          .ffmpegKitConfigAsyncFFmpegExecute(ffmpegSession.getSessionId());
    } on PlatformException catch (e, stack) {
      print("Plugin asyncFFmpegExecute error: ${e.message}");
      return Future.error("asyncFFmpegExecute failed.", stack);
    }
  }

  static Future<void> asyncFFprobeExecute(FFprobeSession ffprobeSession) async {
    try {
      await init();
      return _platform
          .ffmpegKitConfigAsyncFFprobeExecute(ffprobeSession.getSessionId());
    } on PlatformException catch (e, stack) {
      print("Plugin asyncFFprobeExecute error: ${e.message}");
      return Future.error("asyncFFprobeExecute failed.", stack);
    }
  }

  static Future<void> asyncGetMediaInformationExecute(
      MediaInformationSession mediaInformationSession,
      [int? waitTimeout = null]) async {
    try {
      await init();
      return _platform.ffmpegKitConfigAsyncGetMediaInformationExecute(
          mediaInformationSession.getSessionId(), waitTimeout);
    } on PlatformException catch (e, stack) {
      print("Plugin asyncGetMediaInformationExecute error: ${e.message}");
      return Future.error("asyncGetMediaInformationExecute failed.", stack);
    }
  }

  static void enableLogCallback([LogCallback? logCallback = null]) {
    FFmpegKitFactory.setGlobalLogCallback(logCallback);
  }

  static void enableStatisticsCallback(
      [StatisticsCallback? statisticsCallback = null]) {
    FFmpegKitFactory.setGlobalStatisticsCallback(statisticsCallback);
  }

  static void enableExecuteCallback([ExecuteCallback? executeCallback = null]) {
    FFmpegKitFactory.setGlobalExecuteCallback(executeCallback);
  }

  static int getLogLevel() => _activeLogLevel;

  static Future<void> setLogLevel(int logLevel) async {
    _activeLogLevel = logLevel;
    try {
      await init();
      return _platform.ffmpegKitConfigSetLogLevel(logLevel);
    } on PlatformException catch (e, stack) {
      print("Plugin setLogLevel error: ${e.message}");
      return Future.error("setLogLevel failed.", stack);
    }
  }

  static Future<int?> getSessionHistorySize() async {
    try {
      await init();
      return _platform.ffmpegKitConfigGetSessionHistorySize();
    } on PlatformException catch (e, stack) {
      print("Plugin getSessionHistorySize error: ${e.message}");
      return Future.error("getSessionHistorySize failed.", stack);
    }
  }

  static Future<void> setSessionHistorySize(int sessionHistorySize) async {
    try {
      await init();
      return _platform.ffmpegKitConfigSetSessionHistorySize(sessionHistorySize);
    } on PlatformException catch (e, stack) {
      print("Plugin setSessionHistorySize error: ${e.message}");
      return Future.error("setSessionHistorySize failed.", stack);
    }
  }

  static Future<Session?> getSession(int sessionId) async {
    try {
      await init();
      return _platform
          .ffmpegKitConfigGetSession(sessionId)
          .then(FFmpegKitFactory.mapToNullableSession);
    } on PlatformException catch (e, stack) {
      print("Plugin getSession error: ${e.message}");
      return Future.error("getSession failed.", stack);
    }
  }

  static Future<Session?> getLastSession() async {
    try {
      await init();
      return _platform
          .ffmpegKitConfigGetLastSession()
          .then(FFmpegKitFactory.mapToNullableSession);
    } on PlatformException catch (e, stack) {
      print("Plugin getLastSession error: ${e.message}");
      return Future.error("getLastSession failed.", stack);
    }
  }

  static Future<Session?> getLastCompletedSession() async {
    try {
      await init();
      return _platform
          .ffmpegKitConfigGetLastCompletedSession()
          .then(FFmpegKitFactory.mapToNullableSession);
    } on PlatformException catch (e, stack) {
      print("Plugin getLastCompletedSession error: ${e.message}");
      return Future.error("getLastCompletedSession failed.", stack);
    }
  }

  static Future<List<Session>> getSessions() async {
    try {
      await init();
      return _platform.ffmpegKitConfigGetSessions().then((sessions) {
        if (sessions == null) {
          return List.empty();
        } else {
          return sessions
              .map((dynamic sessionObject) => FFmpegKitFactory.mapToSession(
                  sessionObject as Map<dynamic, dynamic>))
              .toList();
        }
      });
    } on PlatformException catch (e, stack) {
      print("Plugin getSessions error: ${e.message}");
      return Future.error("getSessions failed.", stack);
    }
  }

  static Future<List<Session>> getSessionsByState(
      SessionState sessionState) async {
    try {
      await init();
      return _platform
          .ffmpegKitConfigGetSessionsByState(sessionState.index)
          .then((sessions) {
        if (sessions == null) {
          return List.empty();
        } else {
          return sessions
              .map((dynamic sessionObject) => FFmpegKitFactory.mapToSession(
                  sessionObject as Map<dynamic, dynamic>))
              .toList();
        }
      });
    } on PlatformException catch (e, stack) {
      print("Plugin getSessionsByState error: ${e.message}");
      return Future.error("getSessionsByState failed.", stack);
    }
  }

  static LogRedirectionStrategy getLogRedirectionStrategy() =>
      _globalLogRedirectionStrategy;

  static void setLogRedirectionStrategy(
      LogRedirectionStrategy logRedirectionStrategy) {
    _globalLogRedirectionStrategy = logRedirectionStrategy;
  }

  static Future<int?> messagesInTransmit(int sessionId) async {
    try {
      await init();
      return _platform.ffmpegKitConfigMessagesInTransmit(sessionId);
    } on PlatformException catch (e, stack) {
      print("Plugin messagesInTransmit error: ${e.message}");
      return Future.error("messagesInTransmit failed.", stack);
    }
  }

  static String sessionStateToString(SessionState state) {
    switch (state) {
      case SessionState.created:
        return "CREATED";
      case SessionState.running:
        return "RUNNING";
      case SessionState.failed:
        return "FAILED";
      case SessionState.completed:
        return "COMPLETED";
      default:
        return "";
    }
  }

  // THE FOLLOWING METHODS ARE FLUTTER SPECIFIC

  static Future<void> enableLogs() async {
    try {
      await init();
      return _platform.ffmpegKitConfigEnableLogs();
    } on PlatformException catch (e, stack) {
      print("Plugin enableLogs error: ${e.message}");
      return Future.error("enableLogs failed.", stack);
    }
  }

  static Future<void> disableLogs() async {
    try {
      await init();
      return _platform.ffmpegKitConfigDisableLogs();
    } on PlatformException catch (e, stack) {
      print("Plugin disableLogs error: ${e.message}");
      return Future.error("disableLogs failed.", stack);
    }
  }

  static Future<void> enableStatistics() async {
    try {
      await init();
      return _platform.ffmpegKitConfigEnableStatistics();
    } on PlatformException catch (e, stack) {
      print("Plugin enableStatistics error: ${e.message}");
      return Future.error("enableStatistics failed.", stack);
    }
  }

  static Future<void> disableStatistics() async {
    try {
      await init();
      return _platform.ffmpegKitConfigDisableStatistics();
    } on PlatformException catch (e, stack) {
      print("Plugin disableStatistics error: ${e.message}");
      return Future.error("disableStatistics failed.", stack);
    }
  }

  static Future<String?> getPlatform() async {
    try {
      await init();
      return _platform.ffmpegKitConfigGetPlatform();
    } on PlatformException catch (e, stack) {
      print("Plugin getPlatform error: ${e.message}");
      return Future.error("getPlatform failed.", stack);
    }
  }

  static Future<int?> writeToPipe(String inputPath, String pipePath) async {
    try {
      await init();
      return _platform.ffmpegKitConfigWriteToPipe(inputPath, pipePath);
    } on PlatformException catch (e, stack) {
      print("Plugin writeToPipe error: ${e.message}");
      return Future.error("writeToPipe failed.", stack);
    }
  }

  static Future<String?> selectDocumentForRead(
      [String? type = null, List<String>? extraTypes = null]) async {
    try {
      await init();
      return _platform.ffmpegKitConfigSelectDocumentForRead(type, extraTypes);
    } on PlatformException catch (e, stack) {
      print("Plugin selectDocumentForRead error: ${e.message}");
      return Future.error("selectDocumentForRead failed.", stack);
    }
  }

  static Future<String?> selectDocumentForWrite(
      [String? title = null,
      String? type = null,
      List<String>? extraTypes = null]) async {
    try {
      await init();
      return _platform.ffmpegKitConfigSelectDocumentForWrite(
          title, type, extraTypes);
    } on PlatformException catch (e, stack) {
      print("Plugin selectDocumentForWrite error: ${e.message}");
      return Future.error("selectDocumentForWrite failed.", stack);
    }
  }

  static Future<String?> getSafParameterForRead(String uriString) async {
    try {
      await init();
      return _platform.ffmpegKitConfigGetSafParameterForRead(uriString);
    } on PlatformException catch (e, stack) {
      print("Plugin getSafParameterForRead error: ${e.message}");
      return Future.error("getSafParameterForRead failed.", stack);
    }
  }

  static Future<String?> getSafParameterForWrite(String uriString) async {
    try {
      await init();
      return _platform.ffmpegKitConfigGetSafParameterForWrite(uriString);
    } on PlatformException catch (e, stack) {
      print("Plugin getSafParameterForWrite error: ${e.message}");
      return Future.error("getSafParameterForWrite failed.", stack);
    }
  }
}

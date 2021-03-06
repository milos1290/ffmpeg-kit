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
import 'ffmpeg_kit.dart';
import 'ffmpeg_kit_config.dart';
import 'ffmpeg_session.dart';
import 'ffprobe_session.dart';
import 'log.dart';
import 'log_callback.dart';
import 'log_redirection_strategy.dart';
import 'media_information.dart';
import 'media_information_session.dart';
import 'return_code.dart';
import 'session.dart';
import 'session_state.dart';
import 'src/ffmpeg_kit_factory.dart';

class AbstractSession extends Session {
  static FFmpegKitPlatform _platform = FFmpegKitPlatform.instance;

  /**
   * Defines how long default "getAll" methods wait, in milliseconds.
   */
  static const defaultTimeoutForAsynchronousMessagesInTransmit = 5000;

  /**
   * Session identifier.
   */
  int? _sessionId;

  /**
   * Date and time the session was created.
   */
  DateTime? _createTime;

  /**
   * Date and time the session was started.
   */
  DateTime? _startTime;

  /**
   * Command string.
   */
  String? _command;

  /**
   * Command arguments as an array.
   */
  List<String>? _argumentsArray;

  /**
   * Session specific log redirection strategy.
   */
  LogRedirectionStrategy? _logRedirectionStrategy;

  static Future<FFmpegSession> createFFmpegSession(List<String> argumentsArray,
      [LogRedirectionStrategy? logRedirectionStrategy = null]) async {
    try {
      await FFmpegKitConfig.init();
      final Map<dynamic, dynamic>? nativeSession =
          await _platform.abstractSessionCreateFFmpegSession(argumentsArray);

      final session = new FFmpegSession();

      session._sessionId = nativeSession?["sessionId"];
      session._createTime =
          FFmpegKitFactory.validDate(nativeSession?["createTime"]);
      session._startTime =
          FFmpegKitFactory.validDate(nativeSession?["startTime"]);
      session._command = nativeSession?["command"];
      session._argumentsArray = argumentsArray;
      session._logRedirectionStrategy =
          logRedirectionStrategy ?? FFmpegKitConfig.getLogRedirectionStrategy();

      FFmpegKitFactory.setLogRedirectionStrategy(
          session._sessionId, logRedirectionStrategy);

      return session;
    } on PlatformException catch (e, stack) {
      print("Plugin createFFmpegSession error: ${e.message}");
      return Future.error("createFFmpegSession failed.", stack);
    }
  }

  static FFmpegSession createFFmpegSessionFromMap(
      Map<dynamic, dynamic> sessionMap) {
    final session = new FFmpegSession();

    session._sessionId = sessionMap["sessionId"];
    session._createTime = FFmpegKitFactory.validDate(sessionMap["createTime"]);
    session._startTime = FFmpegKitFactory.validDate(sessionMap["startTime"]);
    session._command = sessionMap["command"];
    session._argumentsArray = FFmpegKit.parseArguments(sessionMap["command"]);
    session._logRedirectionStrategy =
        FFmpegKitFactory.getLogRedirectionStrategy(session._sessionId);

    return session;
  }

  static Future<FFprobeSession> createFFprobeSession(
      List<String> argumentsArray,
      [LogRedirectionStrategy? logRedirectionStrategy = null]) async {
    try {
      await FFmpegKitConfig.init();
      final Map<dynamic, dynamic>? nativeSession =
          await _platform.abstractSessionCreateFFprobeSession(argumentsArray);

      final session = new FFprobeSession();

      session._sessionId = nativeSession?["sessionId"];
      session._createTime =
          FFmpegKitFactory.validDate(nativeSession?["createTime"]);
      session._startTime =
          FFmpegKitFactory.validDate(nativeSession?["startTime"]);
      session._command = nativeSession?["command"];
      session._argumentsArray = argumentsArray;
      session._logRedirectionStrategy =
          logRedirectionStrategy ?? FFmpegKitConfig.getLogRedirectionStrategy();

      FFmpegKitFactory.setLogRedirectionStrategy(
          session._sessionId, logRedirectionStrategy);

      return session;
    } on PlatformException catch (e, stack) {
      print("Plugin createFFprobeSession error: ${e.message}");
      return Future.error("createFFprobeSession failed.", stack);
    }
  }

  static FFprobeSession createFFprobeSessionFromMap(
      Map<dynamic, dynamic> sessionMap) {
    final session = new FFprobeSession();

    session._sessionId = sessionMap["sessionId"];
    session._createTime = FFmpegKitFactory.validDate(sessionMap["createTime"]);
    session._startTime = FFmpegKitFactory.validDate(sessionMap["startTime"]);
    session._command = sessionMap["command"];
    session._argumentsArray = FFmpegKit.parseArguments(sessionMap["command"]);
    session._logRedirectionStrategy =
        FFmpegKitFactory.getLogRedirectionStrategy(session._sessionId);

    return session;
  }

  static Future<MediaInformationSession> createMediaInformationSession(
      List<String> argumentsArray) async {
    try {
      await FFmpegKitConfig.init();
      final Map<dynamic, dynamic>? nativeSession = await _platform
          .abstractSessionCreateMediaInformationSession(argumentsArray);
      final session = new MediaInformationSession();

      session._sessionId = nativeSession?["sessionId"];
      session._createTime =
          FFmpegKitFactory.validDate(nativeSession?["createTime"]);
      session._startTime =
          FFmpegKitFactory.validDate(nativeSession?["startTime"]);
      session._command = nativeSession?["command"];
      session._argumentsArray = argumentsArray;
      session._logRedirectionStrategy = LogRedirectionStrategy.neverPrintLogs;

      FFmpegKitFactory.setLogRedirectionStrategy(
          session._sessionId, LogRedirectionStrategy.neverPrintLogs);

      return session;
    } on PlatformException catch (e, stack) {
      print("Plugin createMediaInformationSession error: ${e.message}");
      return Future.error("createMediaInformationSession failed.", stack);
    }
  }

  static MediaInformationSession createMediaInformationSessionFromMap(
      Map<dynamic, dynamic> sessionMap) {
    final session = new MediaInformationSession();

    session._sessionId = sessionMap["sessionId"];
    session._createTime = FFmpegKitFactory.validDate(sessionMap["createTime"]);
    session._startTime = FFmpegKitFactory.validDate(sessionMap["startTime"]);
    session._command = sessionMap["command"];
    session._argumentsArray = FFmpegKit.parseArguments(sessionMap["command"]);
    session._logRedirectionStrategy = LogRedirectionStrategy.neverPrintLogs;

    if (sessionMap.containsKey("mediaInformation")) {
      session.setMediaInformation(
          new MediaInformation(sessionMap["mediaInformation"]));
    }

    return session;
  }

  ExecuteCallback? getExecuteCallback() =>
      FFmpegKitFactory.getExecuteCallback(this.getSessionId());

  LogCallback? getLogCallback() =>
      FFmpegKitFactory.getLogCallback(this.getSessionId());

  int? getSessionId() => this._sessionId;

  DateTime? getCreateTime() => this._createTime;

  DateTime? getStartTime() => this._startTime;

  Future<DateTime?> getEndTime() async {
    try {
      return _platform
          .abstractSessionGetEndTime(this.getSessionId())
          .then(FFmpegKitFactory.validDate);
    } on PlatformException catch (e, stack) {
      print("Plugin getEndTime error: ${e.message}");
      return Future.error("getEndTime failed.", stack);
    }
  }

  Future<int> getDuration() async {
    try {
      return _platform
          .abstractSessionGetDuration(this.getSessionId())
          .then((duration) => duration ?? 0);
    } on PlatformException catch (e, stack) {
      print("Plugin getDuration error: ${e.message}");
      return Future.error("getDuration failed.", stack);
    }
  }

  List<String>? getArguments() => this._argumentsArray;

  String? getCommand() => this._command;

  Future<List<Log>> getAllLogs([int? waitTimeout = null]) async {
    try {
      return _platform
          .abstractSessionGetAllLogs(this.getSessionId(), waitTimeout)
          .then((allLogs) {
        if (allLogs == null) {
          return List.empty();
        } else {
          return allLogs
              .map((dynamic logObject) =>
                  FFmpegKitFactory.mapToLog(logObject as Map<dynamic, dynamic>))
              .toList();
        }
      });
    } on PlatformException catch (e, stack) {
      print("Plugin getAllLogs error: ${e.message}");
      return Future.error("getAllLogs failed.", stack);
    }
  }

  Future<List<Log>> getLogs() async {
    try {
      return _platform
          .abstractSessionGetLogs(this.getSessionId())
          .then((allLogs) {
        if (allLogs == null) {
          return List.empty();
        } else {
          return allLogs
              .map((dynamic logObject) =>
                  FFmpegKitFactory.mapToLog(logObject as Map<dynamic, dynamic>))
              .toList();
        }
      });
    } on PlatformException catch (e, stack) {
      print("Plugin getLogs error: ${e.message}");
      return Future.error("getLogs failed.", stack);
    }
  }

  Future<String?> getAllLogsAsString([int? waitTimeout = null]) async {
    try {
      return _platform.abstractSessionGetAllLogsAsString(
          this.getSessionId(), waitTimeout);
    } on PlatformException catch (e, stack) {
      print("Plugin getAllLogsAsString error: ${e.message}");
      return Future.error("getAllLogsAsString failed.", stack);
    }
  }

  Future<String> getLogsAsString() async {
    final StringBuffer concatenatedString = new StringBuffer();

    void concatLog(Log log) => concatenatedString.write(log.getMessage());

    final List<Log> logs = await this.getLogs();

    logs.forEach(concatLog);

    return concatenatedString.toString();
  }

  Future<String?> getOutput() async => this.getAllLogsAsString();

  Future<SessionState> getState() async {
    try {
      return _platform
          .abstractSessionGetState(this.getSessionId())
          .then((state) {
        switch (state) {
          case 0:
            return SessionState.created;
          case 1:
            return SessionState.running;
          case 2:
            return SessionState.failed;
          case 3:
          default:
            return SessionState.completed;
        }
      });
    } on PlatformException catch (e, stack) {
      print("Plugin getState error: ${e.message}");
      return Future.error("getState failed.", stack);
    }
  }

  Future<ReturnCode?> getReturnCode() async {
    try {
      return _platform
          .abstractSessionGetReturnCode(this.getSessionId())
          .then((returnCode) {
        if (returnCode == null) {
          return null;
        } else {
          return new ReturnCode(returnCode);
        }
      });
    } on PlatformException catch (e, stack) {
      print("Plugin getReturnCode error: ${e.message}");
      return Future.error("getReturnCode failed.", stack);
    }
  }

  Future<String?> getFailStackTrace() async {
    try {
      return _platform.abstractSessionGetFailStackTrace(this.getSessionId());
    } on PlatformException catch (e, stack) {
      print("Plugin getFailStackTrace error: ${e.message}");
      return Future.error("getFailStackTrace failed.", stack);
    }
  }

  LogRedirectionStrategy? getLogRedirectionStrategy() =>
      this._logRedirectionStrategy;

  Future<bool> thereAreAsynchronousMessagesInTransmit() async {
    try {
      return _platform.abstractSessionThereAreAsynchronousMessagesInTransmit(
          this.getSessionId());
    } on PlatformException catch (e, stack) {
      print(
          "Plugin thereAreAsynchronousMessagesInTransmit error: ${e.message}");
      return Future.error(
          "thereAreAsynchronousMessagesInTransmit failed.", stack);
    }
  }

  bool isFFmpeg() => false;

  bool isFFprobe() => false;

  void cancel() {}
}

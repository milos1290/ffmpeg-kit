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
import 'ffprobe_session.dart';
import 'log_callback.dart';
import 'media_information_session.dart';
import 'src/ffmpeg_kit_factory.dart';

class FFprobeKit {
  static FFmpegKitPlatform _platform = FFmpegKitPlatform.instance;

  static Future<FFprobeSession> executeAsync(String command,
          [ExecuteCallback? executeCallback = null,
          LogCallback? logCallback = null]) async =>
      FFprobeKit.executeWithArgumentsAsync(
          FFmpegKit.parseArguments(command), executeCallback, logCallback);

  static Future<FFprobeSession> executeWithArgumentsAsync(
      List<String> commandArguments,
      [ExecuteCallback? executeCallback = null,
      LogCallback? logCallback = null]) async {
    final session = await FFprobeSession.create(
        commandArguments, executeCallback, logCallback, null);

    await FFmpegKitConfig.asyncFFprobeExecute(session);

    return session;
  }

  static Future<MediaInformationSession> getMediaInformationAsync(String path,
      [ExecuteCallback? executeCallback = null,
      LogCallback? logCallback = null,
      int? waitTimeout = null]) async {
    final commandArguments = [
      "-v",
      "error",
      "-hide_banner",
      "-print_format",
      "json",
      "-show_format",
      "-show_streams",
      "-i",
      path
    ];
    return FFprobeKit.getMediaInformationFromCommandArgumentsAsync(
        commandArguments, executeCallback, logCallback, waitTimeout);
  }

  static Future<MediaInformationSession> getMediaInformationFromCommandAsync(
          String command,
          [ExecuteCallback? executeCallback = null,
          LogCallback? logCallback = null,
          int? waitTimeout = null]) async =>
      FFprobeKit.getMediaInformationFromCommandArgumentsAsync(
          FFmpegKit.parseArguments(command),
          executeCallback,
          logCallback,
          waitTimeout);

  static Future<MediaInformationSession>
      getMediaInformationFromCommandArgumentsAsync(
          List<String> commandArguments,
          [ExecuteCallback? executeCallback = null,
          LogCallback? logCallback = null,
          int? waitTimeout = null]) async {
    final session = await MediaInformationSession.create(
        commandArguments, executeCallback, logCallback);

    await FFmpegKitConfig.asyncGetMediaInformationExecute(session, waitTimeout);

    return session;
  }

  static Future<List<FFprobeSession>> listSessions() async {
    try {
      await FFmpegKitConfig.init();
      return _platform.ffprobeKitListSessions().then((sessions) {
        if (sessions == null) {
          return List.empty();
        } else {
          return sessions
              .map((dynamic sessionObject) => FFmpegKitFactory.mapToSession(
                  sessionObject as Map<dynamic, dynamic>))
              .map((session) => session as FFprobeSession)
              .toList();
        }
      });
    } on PlatformException catch (e, stack) {
      print("Plugin listSessions error: ${e.message}");
      return Future.error("listSessions failed.", stack);
    }
  }
}

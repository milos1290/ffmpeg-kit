/*
 * Copyright (c) 2021 Taner Sener
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

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel_ffmpeg_kit.dart';

abstract class FFmpegKitPlatform extends PlatformInterface {
  /// Constructs a FFmpegKitPlatform.
  FFmpegKitPlatform() : super(token: _token);

  static final Object _token = Object();

  static FFmpegKitPlatform _instance = MethodChannelFFmpegKit();

  /// The default instance of [FFmpegKitPlatform] to use.
  ///
  /// Defaults to [MethodChannelFFmpegKit].
  static FFmpegKitPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [FFmpegKitPlatform] when they register
  /// themselves.
  static set instance(FFmpegKitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  // AbstractSession

  Future<Map<dynamic, dynamic>?> abstractSessionCreateFFmpegSession(
      List<String> argumentsArray) async {
    throw UnimplementedError(
        'abstractSessionCreateFFmpegSession() has not been implemented!');
  }

  Future<Map<dynamic, dynamic>?> abstractSessionCreateFFprobeSession(
      List<String> argumentsArray) async {
    throw UnimplementedError(
        'abstractSessionCreateFFprobeSession() has not been implemented!');
  }

  Future<Map<dynamic, dynamic>?> abstractSessionCreateMediaInformationSession(
      List<String> argumentsArray) async {
    throw UnimplementedError('abstractSessionCreateMediaInformationSession()'
        ' has not been implemented!');
  }

  Future<int?> abstractSessionGetEndTime(int? sessionId) async {
    throw UnimplementedError(
        'abstractSessionGetEndTime() has not been implemented!');
  }

  Future<int?> abstractSessionGetDuration(int? sessionId) async {
    throw UnimplementedError(
        'abstractSessionGetDuration() has not been implemented!');
  }

  Future<List<dynamic>?> abstractSessionGetAllLogs(
      int? sessionId, int? waitTimeout) async {
    throw UnimplementedError(
        'abstractSessionGetAllLogs() has not been implemented!');
  }

  Future<List<dynamic>?> abstractSessionGetLogs(int? sessionId) async {
    throw UnimplementedError(
        'abstractSessionGetLogs() has not been implemented!');
  }

  Future<String?> abstractSessionGetAllLogsAsString(
      int? sessionId, int? waitTimeout) async {
    throw UnimplementedError(
        'abstractSessionGetAllLogsAsString() has not been implemented!');
  }

  Future<int?> abstractSessionGetState(int? sessionId) async {
    throw UnimplementedError(
        'abstractSessionGetState() has not been implemented!');
  }

  Future<int?> abstractSessionGetReturnCode(int? sessionId) async {
    throw UnimplementedError(
        'abstractSessionGetReturnCode() has not been implemented!');
  }

  Future<String?> abstractSessionGetFailStackTrace(int? sessionId) async {
    throw UnimplementedError(
        'abstractSessionGetFailStackTrace() has not been implemented!');
  }

  Future<bool> abstractSessionThereAreAsynchronousMessagesInTransmit(
      int? sessionId) async {
    throw UnimplementedError(
        'abstractSessionThereAreAsynchronousMessagesInTransmit()'
        ' has not been implemented!');
  }

  // ArchDetect

  Future<String> archDetectGetArch() async {
    throw UnimplementedError('archDetectGetArch() has not been implemented!');
  }

  // FFmpegKit

  Future<void> ffmpegKitCancel(int? sessionId) async {
    throw UnimplementedError('ffmpegKitCancel() has not been implemented!');
  }

  Future<List<dynamic>?> ffmpegKitListSessions() async {
    throw UnimplementedError(
        'ffmpegKitListSessions() has not been implemented!');
  }

  // FFmpegKitConfig

  Future<void> ffmpegKitConfigEnableRedirection() async {
    throw UnimplementedError(
        'ffmpegKitConfigEnableRedirection() has not been implemented!');
  }

  Future<void> ffmpegKitConfigDisableRedirection() async {
    throw UnimplementedError(
        'ffmpegKitConfigDisableRedirection() has not been implemented!');
  }

  Future<void> ffmpegKitConfigSetFontconfigConfigurationPath(
      String path) async {
    throw UnimplementedError('ffmpegKitConfigSetFontconfigConfigurationPath()'
        ' has not been implemented!');
  }

  Future<void> ffmpegKitConfigSetFontDirectory(
      String path, Map<String, String>? mapping) async {
    throw UnimplementedError(
        'ffmpegKitConfigSetFontDirectory() has not been implemented!');
  }

  Future<void> ffmpegKitConfigSetFontDirectoryList(
      List<String> fontDirectoryList, Map<String, String>? mapping) async {
    throw UnimplementedError(
        'ffmpegKitConfigSetFontDirectoryList() has not been implemented!');
  }

  Future<String?> ffmpegKitConfigRegisterNewFFmpegPipe() async {
    throw UnimplementedError(
        'ffmpegKitConfigRegisterNewFFmpegPipe() has not been implemented!');
  }

  Future<void> ffmpegKitConfigCloseFFmpegPipe(String ffmpegPipePath) async {
    throw UnimplementedError(
        'ffmpegKitConfigCloseFFmpegPipe() has not been implemented!');
  }

  Future<String?> ffmpegKitConfigGetFFmpegVersion() async {
    throw UnimplementedError(
        'ffmpegKitConfigGetFFmpegVersion() has not been implemented!');
  }

  Future<bool?> ffmpegKitConfigIsLTSBuild() async {
    throw UnimplementedError(
        'ffmpegKitConfigIsLTSBuild() has not been implemented!');
  }

  Future<String?> ffmpegKitConfigGetBuildDate() async {
    throw UnimplementedError(
        'ffmpegKitConfigGetBuildDate() has not been implemented!');
  }

  Future<void> ffmpegKitConfigSetEnvironmentVariable(
      String name, String value) async {
    throw UnimplementedError(
        'ffmpegKitConfigSetEnvironmentVariable() has not been implemented!');
  }

  Future<void> ffmpegKitConfigIgnoreSignal(int signal) async {
    throw UnimplementedError(
        'ffmpegKitConfigIgnoreSignal() has not been implemented!');
  }

  Future<void> ffmpegKitConfigAsyncFFmpegExecute(int? sessionId) async {
    throw UnimplementedError(
        'ffmpegKitConfigAsyncFFmpegExecute() has not been implemented!');
  }

  Future<void> ffmpegKitConfigAsyncFFprobeExecute(int? sessionId) async {
    throw UnimplementedError(
        'ffmpegKitConfigAsyncFFprobeExecute() has not been implemented!');
  }

  Future<void> ffmpegKitConfigAsyncGetMediaInformationExecute(
      int? sessionId, int? waitTimeout) async {
    throw UnimplementedError('ffmpegKitConfigAsyncGetMediaInformationExecute()'
        ' has not been implemented!');
  }

  Future<void> ffmpegKitConfigSetLogLevel(int logLevel) async {
    throw UnimplementedError(
        'ffmpegKitConfigSetLogLevel() has not been implemented!');
  }

  Future<int?> ffmpegKitConfigGetSessionHistorySize() async {
    throw UnimplementedError(
        'ffmpegKitConfigGetSessionHistorySize() has not been implemented!');
  }

  Future<void> ffmpegKitConfigSetSessionHistorySize(
      int sessionHistorySize) async {
    throw UnimplementedError(
        'ffmpegKitConfigSetSessionHistorySize() has not been implemented!');
  }

  Future<Map<dynamic, dynamic>?> ffmpegKitConfigGetSession(
      int sessionId) async {
    throw UnimplementedError(
        'ffmpegKitConfigGetSession() has not been implemented!');
  }

  Future<Map<dynamic, dynamic>?> ffmpegKitConfigGetLastSession() async {
    throw UnimplementedError(
        'ffmpegKitConfigGetLastSession() has not been implemented!');
  }

  Future<Map<dynamic, dynamic>?>
      ffmpegKitConfigGetLastCompletedSession() async {
    throw UnimplementedError(
        'ffmpegKitConfigGetLastCompletedSession() has not been implemented!');
  }

  Future<List<dynamic>?> ffmpegKitConfigGetSessions() async {
    throw UnimplementedError(
        'ffmpegKitConfigGetSessions() has not been implemented!');
  }

  Future<List<dynamic>?> ffmpegKitConfigGetSessionsByState(
      int sessionState) async {
    throw UnimplementedError(
        'ffmpegKitConfigGetSessionsByState() has not been implemented!');
  }

  Future<int?> ffmpegKitConfigMessagesInTransmit(int sessionId) async {
    throw UnimplementedError(
        'ffmpegKitConfigMessagesInTransmit() has not been implemented!');
  }

  Future<void> ffmpegKitConfigEnableLogs() async {
    throw UnimplementedError(
        'ffmpegKitConfigEnableLogs() has not been implemented!');
  }

  Future<void> ffmpegKitConfigDisableLogs() async {
    throw UnimplementedError(
        'ffmpegKitConfigDisableLogs() has not been implemented!');
  }

  Future<void> ffmpegKitConfigEnableStatistics() async {
    throw UnimplementedError(
        'ffmpegKitConfigEnableStatistics() has not been implemented!');
  }

  Future<void> ffmpegKitConfigDisableStatistics() async {
    throw UnimplementedError(
        'ffmpegKitConfigDisableStatistics() has not been implemented!');
  }

  Future<String?> ffmpegKitConfigGetPlatform() async {
    throw UnimplementedError(
        'ffmpegKitConfigGetPlatform() has not been implemented!');
  }

  Future<int?> ffmpegKitConfigWriteToPipe(
      String inputPath, String pipePath) async {
    throw UnimplementedError(
        'ffmpegKitConfigWriteToPipe() has not been implemented!');
  }

  Future<String?> ffmpegKitConfigSelectDocumentForRead(
      String? type, List<String>? extraTypes) async {
    throw UnimplementedError(
        'ffmpegKitConfigSelectDocumentForRead() has not been implemented!');
  }

  Future<String?> ffmpegKitConfigSelectDocumentForWrite(
      String? title, String? type, List<String>? extraTypes) async {
    throw UnimplementedError(
        'ffmpegKitConfigSelectDocumentForWrite() has not been implemented!');
  }

  Future<String?> ffmpegKitConfigGetSafParameterForRead(
      String uriString) async {
    throw UnimplementedError(
        'ffmpegKitConfigGetSafParameterForRead() has not been implemented!');
  }

  Future<String?> ffmpegKitConfigGetSafParameterForWrite(
      String uriString) async {
    throw UnimplementedError(
        'ffmpegKitConfigGetSafParameterForWrite() has not been implemented!');
  }

  // FFmpegKitFlutterInitializer

  Future<int?> ffmpegKitFlutterInitializerGetLogLevel() async {
    throw UnimplementedError(
        'ffmpegKitFlutterInitializerGetLogLevel() has not been implemented!');
  }

  // FFmpegSession

  Future<List<dynamic>?> ffmpegSessionGetAllStatistics(
      int? sessionId, int? waitTimeout) async {
    throw UnimplementedError(
        'ffmpegSessionGetAllStatistics() has not been implemented!');
  }

  Future<List<dynamic>?> ffmpegSessionGetStatistics(int? sessionId) async {
    throw UnimplementedError(
        'ffmpegSessionGetStatistics() has not been implemented!');
  }

  // FFprobeKit

  Future<List<dynamic>?> ffprobeKitListSessions() async {
    throw UnimplementedError(
        'ffprobeKitListSessions() has not been implemented!');
  }

  // MediaInformationJsonParser

  Future<Map<dynamic, dynamic>?> mediaInformationJsonParserFrom(
      String ffprobeJsonOutput) async {
    throw UnimplementedError(
        'mediaInformationJsonParserFrom() has not been implemented!');
  }

  Future<Map<dynamic, dynamic>?> mediaInformationJsonParserFromWithError(
      String ffprobeJsonOutput) async {
    throw UnimplementedError(
        'mediaInformationJsonParserFromWithError() has not been implemented!');
  }
}

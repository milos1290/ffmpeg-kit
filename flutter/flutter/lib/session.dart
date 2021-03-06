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

import 'execute_callback.dart';
import 'log.dart';
import 'log_callback.dart';
import 'log_redirection_strategy.dart';
import 'return_code.dart';
import 'session_state.dart';

abstract class Session {
  ExecuteCallback? getExecuteCallback();

  LogCallback? getLogCallback();

  int? getSessionId();

  DateTime? getCreateTime();

  DateTime? getStartTime();

  Future<DateTime?> getEndTime();

  Future<int> getDuration();

  List<String>? getArguments();

  String? getCommand();

  Future<List<Log>> getAllLogs([int? waitTimeout = null]);

  Future<List<Log>> getLogs();

  Future<String?> getAllLogsAsString([int? waitTimeout = null]);

  Future<String> getLogsAsString();

  Future<String?> getOutput();

  Future<SessionState> getState();

  Future<ReturnCode?> getReturnCode();

  Future<String?> getFailStackTrace();

  LogRedirectionStrategy? getLogRedirectionStrategy();

  Future<bool> thereAreAsynchronousMessagesInTransmit();

  bool isFFmpeg();

  bool isFFprobe();

  void cancel();
}

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

class StreamInformation {
  static const keyIndex = "index";
  static const keyType = "codec_type";
  static const keyCodec = "codec_name";
  static const keyCodecLong = "codec_long_name";
  static const keyFormat = "pix_fmt";
  static const keyWidth = "width";
  static const keyHeight = "height";
  static const keyBitRate = "bit_rate";
  static const keySampleRate = "sample_rate";
  static const keySampleFormat = "sample_fmt";
  static const keyChannelLayout = "channel_layout";
  static const keySampleAspectRatio = "sample_aspect_ratio";
  static const keyDisplayAspectRatio = "display_aspect_ratio";
  static const keyAverageFrameRate = "avg_frame_rate";
  static const keyRealFrameRate = "r_frame_rate";
  static const keyTimeBase = "time_base";
  static const keyCodecTimeBase = "codec_time_base";
  static const keyTags = "tags";

  Map<dynamic, dynamic>? _allProperties;

  /// Creates a new [StreamInformation] instance
  StreamInformation(this._allProperties);

  int? getIndex() => this.getNumberProperty(keyIndex)?.toInt();

  String? getType() => this.getStringProperty(StreamInformation.keyType);

  String? getCodec() => this.getStringProperty(StreamInformation.keyCodec);

  String? getFullCodec() =>
      this.getStringProperty(StreamInformation.keyCodecLong);

  String? getFormat() => this.getStringProperty(StreamInformation.keyFormat);

  int? getWidth() =>
      this.getNumberProperty(StreamInformation.keyWidth)?.toInt();

  int? getHeight() =>
      this.getNumberProperty(StreamInformation.keyHeight)?.toInt();

  String? getBitrate() => this.getStringProperty(StreamInformation.keyBitRate);

  String? getSampleRate() =>
      this.getStringProperty(StreamInformation.keySampleRate);

  String? getSampleFormat() =>
      this.getStringProperty(StreamInformation.keySampleFormat);

  String? getChannelLayout() =>
      this.getStringProperty(StreamInformation.keyChannelLayout);

  String? getSampleAspectRatio() =>
      this.getStringProperty(StreamInformation.keySampleAspectRatio);

  String? getDisplayAspectRatio() =>
      this.getStringProperty(StreamInformation.keyDisplayAspectRatio);

  String? getAverageFrameRate() =>
      this.getStringProperty(StreamInformation.keyAverageFrameRate);

  String? getRealFrameRate() =>
      this.getStringProperty(StreamInformation.keyRealFrameRate);

  String? getTimeBase() =>
      this.getStringProperty(StreamInformation.keyTimeBase);

  String? getCodecTimeBase() =>
      this.getStringProperty(StreamInformation.keyCodecTimeBase);

  Map<dynamic, dynamic>? getTags() =>
      this.getProperties(StreamInformation.keyTags);

  String? getStringProperty(String key) => this._allProperties?[key];

  num? getNumberProperty(String key) => this._allProperties?[key];

  dynamic getProperties(String key) => this._allProperties?[key];

  /// Returns all properties in a map or null if no properties are found
  Map<dynamic, dynamic>? getAllProperties() => this._allProperties;
}

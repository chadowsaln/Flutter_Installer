import 'dart:convert';

import 'package:flutter_installer/src/app/models/flutter_installer_api/app_release.mode.dart';
import 'package:flutter_installer/src/app/models/flutter_installer_api/scripts.model.dart';

class Latest {
  final AppRelease androidStudio;
  final AppRelease visualStudioCode;
  final AppRelease intellijIdea;
  final Scripts scripts;

  const Latest({
    required this.androidStudio,
    required this.visualStudioCode,
    required this.intellijIdea,
    required this.scripts,
  });

  Latest copyWith({
    AppRelease? androidStudio,
    AppRelease? visualStudioCode,
    AppRelease? intellijIdea,
    Scripts? scripts,
  }) {
    return Latest(
      androidStudio: androidStudio ?? this.androidStudio,
      visualStudioCode: visualStudioCode ?? this.visualStudioCode,
      intellijIdea: intellijIdea ?? this.intellijIdea,
      scripts: scripts ?? this.scripts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'android_studio': androidStudio.toMap(),
      'visual_studio_code': visualStudioCode.toMap(),
      'intellij_idea': intellijIdea.toMap(),
      'scripts': scripts.toMap(),
    };
  }

  factory Latest.fromMap(Map<String, dynamic> map) {
    return Latest(
      androidStudio:
          AppRelease.fromMap(map['android_studio'] as Map<String, dynamic>),
      visualStudioCode:
          AppRelease.fromMap(map['visual_studio_code'] as Map<String, dynamic>),
      intellijIdea:
          AppRelease.fromMap(map['intellij_idea'] as Map<String, dynamic>),
      scripts: Scripts.fromMap(map['scripts'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Latest.fromJson(String source) =>
      Latest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Latest(androidStudio: $androidStudio, visualStudioCode: $visualStudioCode, intellijIdea: $intellijIdea, scripts: $scripts)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Latest &&
        other.androidStudio == androidStudio &&
        other.visualStudioCode == visualStudioCode &&
        other.intellijIdea == intellijIdea &&
        other.scripts == scripts;
  }

  @override
  int get hashCode {
    return androidStudio.hashCode ^
        visualStudioCode.hashCode ^
        intellijIdea.hashCode ^
        scripts.hashCode;
  }
}

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_installer/src/app/models/current_release.model.dart';
import 'package:flutter_installer/src/app/models/flutter_release.model.dart';

class Releases {
  final String baseUrl;
  final CurrentRelease currentRelease;
  final List<FlutterRelease> releases;

  const Releases({
    required this.baseUrl,
    required this.currentRelease,
    required this.releases,
  });

  Releases copyWith({
    String? baseUrl,
    CurrentRelease? currentRelease,
    List<FlutterRelease>? releases,
  }) {
    return Releases(
      baseUrl: baseUrl ?? this.baseUrl,
      currentRelease: currentRelease ?? this.currentRelease,
      releases: releases ?? this.releases,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'base_url': baseUrl,
      'current_release': currentRelease.toMap(),
      'releases': releases.map((x) => x.toMap()).toList(),
    };
  }

  factory Releases.fromMap(Map<String, dynamic> map) {
    return Releases(
      baseUrl: map['base_url'] as String,
      currentRelease:
          CurrentRelease.fromMap(map['current_release'] as Map<String, dynamic>),
      releases: (map['releases'] as List<dynamic>)
          .map((x) => FlutterRelease.fromMap(x as Map<String, dynamic>))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Releases.fromJson(String source) =>
      Releases.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Releases(baseUrl: $baseUrl, currentRelease: $currentRelease, releases: $releases)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Releases &&
        other.baseUrl == baseUrl &&
        other.currentRelease == currentRelease &&
        listEquals(other.releases, releases);
  }

  @override
  int get hashCode =>
      baseUrl.hashCode ^ currentRelease.hashCode ^ releases.hashCode;
}

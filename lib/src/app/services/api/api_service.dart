import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'package:flutter_installer/src/app/models/flutter_installer_api/app_release.mode.dart';
import 'package:flutter_installer/src/app/models/flutter_installer_api/latest_release.model.dart';
import 'package:flutter_installer/src/app/models/flutter_installer_api/script_release.model.dart';
import 'package:flutter_installer/src/app/models/flutter_release.model.dart';
import 'package:flutter_installer/src/app/models/github_release.model.dart';
import 'package:flutter_installer/src/app/models/github_release_asset.model.dart';
import 'package:flutter_installer/src/app/models/releases.model.dart';
import 'package:flutter_installer/src/app/models/user_choice.model.dart';
import 'package:flutter_installer/src/app/services/api/my_client.dart';
import 'package:flutter_installer/src/app/utils/logger.dart';

enum FlutterReleasePlatform {
  macOS,
  linux,
  windows,
}

@lazySingleton
class ApiService {
  final logger = getLogger('ApiService');

  final String baseUrlForFlutterRelease =
      'https://storage.googleapis.com/flutter_infra/releases';

  final MyClient myClient = MyClient(http.Client());

  Future<Releases?> getAllFlutterReleases(
    FlutterReleasePlatform platform,
  ) async {
    http.Response response;
    try {
      switch (platform) {
        case FlutterReleasePlatform.windows:
          response = await myClient.get(
            Uri.parse('$baseUrlForFlutterRelease/releases_windows.json'),
          );
          break;
        case FlutterReleasePlatform.macOS:
          response = await myClient.get(
            Uri.parse('$baseUrlForFlutterRelease/releases_macos.json'),
          );
          break;
        case FlutterReleasePlatform.linux:
          response = await myClient.get(
            Uri.parse('$baseUrlForFlutterRelease/releases_linux.json'),
          );
          break;
      }
      Map<String, dynamic> data =
          json.decode(response.body) as Map<String, dynamic>;
      Releases releases = Releases.fromMap(data);

      return releases;
    } catch (e) {
      logger.wtf(e.toString());
    }

    return null;
  }

  Future<FlutterRelease> getLatestRelease({
    required FlutterChannel flutterChannel,
    required FlutterReleasePlatform platform,
  }) async {
    final Releases? releases = await getAllFlutterReleases(platform);

    if (releases == null) {
      throw StateError('Failed to load Flutter releases.');
    }

    String hash;

    switch (flutterChannel) {
      case FlutterChannel.beta:
        hash = releases.currentRelease.beta;
        break;
      case FlutterChannel.dev:
        hash = releases.currentRelease.dev;
        break;
      case FlutterChannel.stable:
        hash = releases.currentRelease.stable;
        break;
    }

    FlutterRelease? latestFlutterRelease;

    releases.releases.forEach((FlutterRelease flutterRelease) {
      if (flutterRelease.hash == hash) {
        latestFlutterRelease = flutterRelease;
      }
    });

    if (latestFlutterRelease == null) {
      throw StateError(
          'No Flutter release found for hash $hash on channel ${convertFlutterChannelEnumToString(flutterChannel)}.');
    }

    return latestFlutterRelease!;
  }

  Future<GithubReleaseAsset> getLatestGitForWindowsRelease() async {
    http.Response response;
    response = await myClient.get(
      Uri.parse(
          'https://api.github.com/repos/git-for-windows/git/releases/latest'),
    );

    Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
    GithubRelease githubRelease = GithubRelease.fromMap(data);

    GithubReleaseAsset githubReleaseAsset = githubRelease.assets[2];

    return githubReleaseAsset;
  }

  Future<AppRelease> getLatestAndroidStudioRelease() async {
    http.Response response;
    response = await myClient.get(
      Uri.parse(
          'https://flutter-installer-api.herokuapp.com/api/v1/latest_release'),
    );

    Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;

    LatestRelease latestRelease = LatestRelease.fromMap(data);

    AppRelease appRelease = latestRelease.latest.androidStudio;

    return appRelease;
  }

  Future<AppRelease> getLatestVisualStudioCodeRelease() async {
    http.Response response;
    response = await myClient.get(
      Uri.parse(
          'https://flutter-installer-api.herokuapp.com/api/v1/latest_release'),
    );

    Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;

    LatestRelease latestRelease = LatestRelease.fromMap(data);

    AppRelease appRelease = latestRelease.latest.visualStudioCode;

    return appRelease;
  }

  Future<AppRelease> getLatestIntelliJIDEARelease() async {
    http.Response response;
    response = await myClient.get(
      Uri.parse(
          'https://flutter-installer-api.herokuapp.com/api/v1/latest_release'),
    );

    Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;

    LatestRelease latestRelease = LatestRelease.fromMap(data);

    AppRelease appRelease = latestRelease.latest.intellijIdea;

    return appRelease;
  }

  Future<ScriptRelease> getLatestAppendToPathScript() async {
    http.Response response;
    response = await myClient.get(
      Uri.parse(
          'https://flutter-installer-api.herokuapp.com/api/v1/latest_release'),
    );

    Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;

    LatestRelease latestRelease = LatestRelease.fromMap(data);

    ScriptRelease scriptRelease = latestRelease.latest.scripts.appendToPath;

    return scriptRelease;
  }

  Future<ScriptRelease> getLatestDistScript() async {
    http.Response response;
    response = await myClient.get(
      Uri.parse(
          'https://flutter-installer-api.herokuapp.com/api/v1/latest_release'),
    );

    Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;

    LatestRelease latestRelease = LatestRelease.fromMap(data);

    ScriptRelease scriptRelease = latestRelease.latest.scripts.dist;

    return scriptRelease;
  }
}

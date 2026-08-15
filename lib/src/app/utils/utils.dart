import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

@lazySingleton
class Utils {
  String clipTextFromMiddle(
    String textToClip, {
    int clipThreshold = 45,
  }) {
    int textToClipLength = textToClip.length;
    if (textToClipLength >= clipThreshold) {
      String editedText = textToClip.substring(0, 20) +
          '...' +
          textToClip.substring(textToClipLength - 20, textToClipLength);

      return editedText;
    }

    return textToClip;
  }

  Future<String> getStringFromFile(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<void> launchUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!Platform.isWindows) {
      if (await launcher.canLaunchUrl(uri)) {
        await launcher.launchUrl(uri, mode: launcher.LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    } else {
      await launcher.launchUrl(uri, mode: launcher.LaunchMode.externalApplication);
    }
  }

  String getAnythingAfterLastSlash(String text) {
    final RegExp getAnythingAfterLastSlash = RegExp('[^/]+\$');
    final RegExpMatch? matches = getAnythingAfterLastSlash.firstMatch(text);

    if (matches == null) {
      return text;
    }

    return matches[0] ?? text;
  }

  String randomString(int length) {
    final String chars = "abcdefghijklmnopqrstuvwxyz0123456789";

    Random rnd = Random(DateTime.now().millisecondsSinceEpoch);
    String result = "";
    for (var i = 0; i < length; i++) {
      result += chars[rnd.nextInt(chars.length)];
    }
    return result;
  }
}

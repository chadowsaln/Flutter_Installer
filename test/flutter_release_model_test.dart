import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_installer/src/app/models/flutter_release.model.dart';

void main() {
  const FlutterRelease flutterRelease = FlutterRelease(
    hash: 'a1b2c3d4e5f6',
    channel: 'stable',
    version: '3.44.8',
    releaseDate: '2026-08-10',
    archive: 'stable/linux/flutter_linux_3.44.8-stable.tar.xz',
    sha256: '0123456789abcdef',
  );

  group('FlutterRelease', () {
    test('copyWith overrides only the provided fields', () {
      final FlutterRelease copied = flutterRelease.copyWith(
        version: '3.45.0',
      );
      expect(copied.version, '3.45.0');
      expect(copied.hash, flutterRelease.hash);
      expect(copied.channel, flutterRelease.channel);
      expect(copied == flutterRelease, isFalse);
    });

    test('toMap/fromMap round trip', () {
      final FlutterRelease restored =
          FlutterRelease.fromMap(flutterRelease.toMap());
      expect(restored, flutterRelease);
    });

    test('toJson/fromJson round trip', () {
      final FlutterRelease restored =
          FlutterRelease.fromJson(flutterRelease.toJson());
      expect(restored, flutterRelease);
    });

    test('equality and hashCode', () {
      const FlutterRelease same = FlutterRelease(
        hash: 'a1b2c3d4e5f6',
        channel: 'stable',
        version: '3.44.8',
        releaseDate: '2026-08-10',
        archive: 'stable/linux/flutter_linux_3.44.8-stable.tar.xz',
        sha256: '0123456789abcdef',
      );
      expect(flutterRelease == same, isTrue);
      expect(flutterRelease.hashCode, same.hashCode);
    });
  });
}

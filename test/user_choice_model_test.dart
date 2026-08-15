import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_installer/src/app/models/user_choice.model.dart';

void main() {
  const UserChoice userChoice = UserChoice(
    installationPath: '/home/user',
    installVisualStudioCode: true,
    installAndroidStudio: false,
    installIntelliJIDEA: true,
    installGit: false,
    flutterChannel: FlutterChannel.beta,
  );

  group('FlutterChannel', () {
    test('convertFlutterChannelEnumToString', () {
      expect(convertFlutterChannelEnumToString(FlutterChannel.dev), 'dev');
      expect(convertFlutterChannelEnumToString(FlutterChannel.beta), 'beta');
      expect(convertFlutterChannelEnumToString(FlutterChannel.stable), 'stable');
    });

    test('convertStringToFlutterChannelEnum', () {
      expect(convertStringToFlutterChannelEnum('dev'), FlutterChannel.dev);
      expect(convertStringToFlutterChannelEnum('beta'), FlutterChannel.beta);
      expect(convertStringToFlutterChannelEnum('stable'), FlutterChannel.stable);
      expect(
        convertStringToFlutterChannelEnum('unknown'),
        FlutterChannel.stable,
      );
    });
  });

  group('UserChoice', () {
    test('defaultChoice constructor', () {
      const UserChoice choice = UserChoice.defaultChoice();
      expect(choice.installationPath, isNull);
      expect(choice.installAndroidStudio, isTrue);
      expect(choice.installGit, isTrue);
      expect(choice.installVisualStudioCode, isFalse);
      expect(choice.installIntelliJIDEA, isFalse);
      expect(choice.flutterChannel, FlutterChannel.stable);
    });

    test('copyWith overrides only the provided fields', () {
      final UserChoice copied = userChoice.copyWith(
        installationPath: '/new/path',
      );
      expect(copied.installationPath, '/new/path');
      expect(copied.installVisualStudioCode, isTrue);
      expect(copied.flutterChannel, FlutterChannel.beta);
      expect(copied == userChoice, isFalse);
    });

    test('toMap/fromMap round trip', () {
      final UserChoice restored = UserChoice.fromMap(userChoice.toMap());
      expect(restored, userChoice);
    });

    test('toJson/fromJson round trip', () {
      final UserChoice restored = UserChoice.fromJson(userChoice.toJson());
      expect(restored, userChoice);
    });

    test('equality and hashCode', () {
      const UserChoice same = UserChoice(
        installationPath: '/home/user',
        installVisualStudioCode: true,
        installAndroidStudio: false,
        installIntelliJIDEA: true,
        installGit: false,
        flutterChannel: FlutterChannel.beta,
      );
      expect(userChoice == same, isTrue);
      expect(userChoice.hashCode, same.hashCode);
    });
  });
}

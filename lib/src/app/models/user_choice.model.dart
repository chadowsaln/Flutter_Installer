import 'dart:convert';

enum FlutterChannel {
  dev,
  beta,
  stable,
}

String convertFlutterChannelEnumToString(FlutterChannel flutterChannel) {
  switch (flutterChannel) {
    case FlutterChannel.dev:
      return "dev";
    case FlutterChannel.beta:
      return "beta";
    case FlutterChannel.stable:
      return "stable";
  }
}

FlutterChannel convertStringToFlutterChannelEnum(String flutterChannelString) {
  switch (flutterChannelString) {
    case "dev":
      return FlutterChannel.dev;
    case "beta":
      return FlutterChannel.beta;
    case "stable":
      return FlutterChannel.stable;
    default:
      return FlutterChannel.stable;
  }
}

class UserChoice {
  final String? installationPath;
  final bool installVisualStudioCode;
  final bool installAndroidStudio;
  final bool installIntelliJIDEA;
  final bool installGit;
  final FlutterChannel flutterChannel;

  const UserChoice({
    required this.installationPath,
    required this.installVisualStudioCode,
    required this.installAndroidStudio,
    required this.installIntelliJIDEA,
    required this.installGit,
    required this.flutterChannel,
  });

  const UserChoice.defaultChoice({
    this.installAndroidStudio = true,
    this.installationPath,
    this.installVisualStudioCode = false,
    this.installIntelliJIDEA = false,
    this.installGit = true,
    this.flutterChannel = FlutterChannel.stable,
  });

  UserChoice copyWith({
    String? installationPath,
    bool? installVisualStudioCode,
    bool? installAndroidStudio,
    bool? installIntelliJIDEA,
    bool? installGit,
    FlutterChannel? flutterChannel,
  }) {
    return UserChoice(
      installationPath: installationPath ?? this.installationPath,
      installVisualStudioCode:
          installVisualStudioCode ?? this.installVisualStudioCode,
      installAndroidStudio: installAndroidStudio ?? this.installAndroidStudio,
      installIntelliJIDEA: installIntelliJIDEA ?? this.installIntelliJIDEA,
      installGit: installGit ?? this.installGit,
      flutterChannel: flutterChannel ?? this.flutterChannel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'installationPath': installationPath,
      'installVisualStudioCode': installVisualStudioCode,
      'installAndroidStudio': installAndroidStudio,
      'installIntelliJIDEA': installIntelliJIDEA,
      'installGit': installGit,
      'flutterChannel': convertFlutterChannelEnumToString(flutterChannel),
    };
  }

  factory UserChoice.fromMap(Map<String, dynamic> map) {
    return UserChoice(
      installationPath: map['installationPath'] as String?,
      installVisualStudioCode: map['installVisualStudioCode'] as bool,
      installAndroidStudio: map['installAndroidStudio'] as bool,
      installIntelliJIDEA: map['installIntelliJIDEA'] as bool,
      installGit: map['installGit'] as bool,
      flutterChannel:
          convertStringToFlutterChannelEnum(map['flutterChannel'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserChoice.fromJson(String source) =>
      UserChoice.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserChoice(installationPath: $installationPath, installVisualStudioCode: $installVisualStudioCode, installAndroidStudio: $installAndroidStudio, installIntelliJIDEA: $installIntelliJIDEA, installGit: $installGit, flutterChannel: $flutterChannel)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserChoice &&
        other.installationPath == installationPath &&
        other.installVisualStudioCode == installVisualStudioCode &&
        other.installAndroidStudio == installAndroidStudio &&
        other.installIntelliJIDEA == installIntelliJIDEA &&
        other.installGit == installGit &&
        other.flutterChannel == flutterChannel;
  }

  @override
  int get hashCode {
    return installationPath.hashCode ^
        installVisualStudioCode.hashCode ^
        installAndroidStudio.hashCode ^
        installIntelliJIDEA.hashCode ^
        installGit.hashCode ^
        flutterChannel.hashCode;
  }
}

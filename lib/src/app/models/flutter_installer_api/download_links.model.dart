import 'dart:convert';

class DownloadLinks {
  final String windows;
  final String linux;
  final String macos;

  const DownloadLinks({
    required this.windows,
    required this.linux,
    required this.macos,
  });

  DownloadLinks copyWith({
    String? windows,
    String? linux,
    String? macos,
  }) {
    return DownloadLinks(
      windows: windows ?? this.windows,
      linux: linux ?? this.linux,
      macos: macos ?? this.macos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'windows': windows,
      'linux': linux,
      'macos': macos,
    };
  }

  factory DownloadLinks.fromMap(Map<String, dynamic> map) {
    return DownloadLinks(
      windows: map['windows'] as String,
      linux: map['linux'] as String,
      macos: map['macos'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DownloadLinks.fromJson(String source) =>
      DownloadLinks.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DownloadLinks(windows: $windows, linux: $linux, macos: $macos)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DownloadLinks &&
        other.windows == windows &&
        other.linux == linux &&
        other.macos == macos;
  }

  @override
  int get hashCode => windows.hashCode ^ linux.hashCode ^ macos.hashCode;
}

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_installer/src/app/models/github_release_asset.model.dart';

class GithubRelease {
  final String url;
  final String assetsUrl;
  final String uploadUrl;
  final String htmlUrl;
  final int id;
  final String nodeId;
  final String tagName;
  final String targetCommitish;
  final String name;
  final bool draft;
  // author
  final bool prerelease;
  final String createdAt;
  final String publishedAt;
  final List<GithubReleaseAsset> assets;

  const GithubRelease({
    required this.url,
    required this.assetsUrl,
    required this.uploadUrl,
    required this.htmlUrl,
    required this.id,
    required this.nodeId,
    required this.tagName,
    required this.targetCommitish,
    required this.name,
    required this.draft,
    required this.prerelease,
    required this.createdAt,
    required this.publishedAt,
    required this.assets,
  });

  GithubRelease copyWith({
    String? url,
    String? assetsUrl,
    String? uploadUrl,
    String? htmlUrl,
    int? id,
    String? nodeId,
    String? tagName,
    String? targetCommitish,
    String? name,
    bool? draft,
    bool? prerelease,
    String? createdAt,
    String? publishedAt,
    List<GithubReleaseAsset>? assets,
  }) {
    return GithubRelease(
      url: url ?? this.url,
      assetsUrl: assetsUrl ?? this.assetsUrl,
      uploadUrl: uploadUrl ?? this.uploadUrl,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      id: id ?? this.id,
      nodeId: nodeId ?? this.nodeId,
      tagName: tagName ?? this.tagName,
      targetCommitish: targetCommitish ?? this.targetCommitish,
      name: name ?? this.name,
      draft: draft ?? this.draft,
      prerelease: prerelease ?? this.prerelease,
      createdAt: createdAt ?? this.createdAt,
      publishedAt: publishedAt ?? this.publishedAt,
      assets: assets ?? this.assets,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'assets_url': assetsUrl,
      'upload_url': uploadUrl,
      'html_url': htmlUrl,
      'id': id,
      'node_id': nodeId,
      'tag_name': tagName,
      'target_commitish': targetCommitish,
      'name': name,
      'draft': draft,
      'prerelease': prerelease,
      'created_at': createdAt,
      'published_at': publishedAt,
      'assets': assets.map((x) => x.toMap()).toList(),
    };
  }

  factory GithubRelease.fromMap(Map<String, dynamic> map) {
    return GithubRelease(
      url: map['url'] as String,
      assetsUrl: map['assets_url'] as String,
      uploadUrl: map['upload_url'] as String,
      htmlUrl: map['html_url'] as String,
      id: map['id'] as int,
      nodeId: map['node_id'] as String,
      tagName: map['tag_name'] as String,
      targetCommitish: map['target_commitish'] as String,
      name: map['name'] as String,
      draft: map['draft'] as bool,
      prerelease: map['prerelease'] as bool,
      createdAt: map['created_at'] as String,
      publishedAt: map['published_at'] as String,
      assets: (map['assets'] as List<dynamic>)
          .map((x) => GithubReleaseAsset.fromMap(x as Map<String, dynamic>))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory GithubRelease.fromJson(String source) =>
      GithubRelease.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GithubRelease(url: $url, assetsUrl: $assetsUrl, uploadUrl: $uploadUrl, htmlUrl: $htmlUrl, id: $id, nodeId: $nodeId, tagName: $tagName, targetCommitish: $targetCommitish, name: $name, draft: $draft, prerelease: $prerelease, createdAt: $createdAt, publishedAt: $publishedAt, assets: $assets)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GithubRelease &&
        other.url == url &&
        other.assetsUrl == assetsUrl &&
        other.uploadUrl == uploadUrl &&
        other.htmlUrl == htmlUrl &&
        other.id == id &&
        other.nodeId == nodeId &&
        other.tagName == tagName &&
        other.targetCommitish == targetCommitish &&
        other.name == name &&
        other.draft == draft &&
        other.prerelease == prerelease &&
        other.createdAt == createdAt &&
        other.publishedAt == publishedAt &&
        listEquals(other.assets, assets);
  }

  @override
  int get hashCode {
    return url.hashCode ^
        assetsUrl.hashCode ^
        uploadUrl.hashCode ^
        htmlUrl.hashCode ^
        id.hashCode ^
        nodeId.hashCode ^
        tagName.hashCode ^
        targetCommitish.hashCode ^
        name.hashCode ^
        draft.hashCode ^
        prerelease.hashCode ^
        createdAt.hashCode ^
        publishedAt.hashCode ^
        assets.hashCode;
  }
}

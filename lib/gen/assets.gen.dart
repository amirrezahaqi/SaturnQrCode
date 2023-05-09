/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/download.svg
  String get download => 'assets/icon/download.svg';

  /// File path: assets/icon/github.svg
  String get github => 'assets/icon/github.svg';

  /// File path: assets/icon/home.svg
  String get home => 'assets/icon/home.svg';

  /// File path: assets/icon/instagram.svg
  String get instagram => 'assets/icon/instagram.svg';

  /// File path: assets/icon/linkedin.svg
  String get linkedin => 'assets/icon/linkedin.svg';

  /// File path: assets/icon/paste.svg
  String get paste => 'assets/icon/paste.svg';

  /// File path: assets/icon/share.svg
  String get share => 'assets/icon/share.svg';

  /// File path: assets/icon/star.svg
  String get star => 'assets/icon/star.svg';

  /// File path: assets/icon/twitter.svg
  String get twitter => 'assets/icon/twitter.svg';

  /// File path: assets/icon/users.svg
  String get users => 'assets/icon/users.svg';

  /// File path: assets/icon/website.svg
  String get website => 'assets/icon/website.svg';

  /// List of all assets
  List<String> get values => [
        download,
        github,
        home,
        instagram,
        linkedin,
        paste,
        share,
        star,
        twitter,
        users,
        website
      ];
}

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/applogo.png
  AssetGenImage get applogo => const AssetGenImage('assets/image/applogo.png');

  /// File path: assets/image/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/image/logo.png');

  /// File path: assets/image/logotext.png
  AssetGenImage get logotext =>
      const AssetGenImage('assets/image/logotext.png');

  /// List of all assets
  List<AssetGenImage> get values => [applogo, logo, logotext];
}

class Assets {
  Assets._();

  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsImageGen image = $AssetsImageGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

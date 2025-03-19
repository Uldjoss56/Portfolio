import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/constants/colors.dart';

Widget imageAsset(
  String name, {
  Key? key,
  AssetBundle? bundle,
  Widget Function(BuildContext, Widget, int?, bool)? frameBuilder,
  Widget Function(BuildContext, Object, StackTrace?)? errorBuilder,
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
  FilterQuality filterQuality = FilterQuality.medium,
  int? cacheWidth,
  int? cacheHeight,
}) {
  return Image.asset(
    name,
    width: width,
    height: height,
    fit: fit,
    color: color,
    alignment: alignment,
    scale: scale,
    opacity: opacity,
    frameBuilder: frameBuilder ??
        (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            return child;
          }
          return AnimatedOpacity(
            opacity: frame == null ? 0 : 1,
            duration: const Duration(seconds: 1),
            child: child,
          );
        },
    errorBuilder: errorBuilder ??
        (context, error, stackTrace) {
          return const Icon(
            Icons.broken_image,
            size: 50,
            color: myTurquois,
          );
        },
  );
}

Widget imageNetwork(
  String name, {
  Key? key,
  AssetBundle? bundle,
  Widget Function(BuildContext, Widget, int?, bool)? frameBuilder,
  Widget Function(BuildContext, Object, StackTrace?)? errorBuilder,
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
  FilterQuality filterQuality = FilterQuality.medium,
  int? cacheWidth,
  int? cacheHeight,
}) {
  return Image.network(
    name,
    width: width,
    height: height,
    fit: fit,
    color: color,
    alignment: alignment,
    scale: scale ?? 1,
    frameBuilder: frameBuilder ??
        (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            return child;
          }
          return AnimatedOpacity(
            opacity: frame == null ? 0 : 1,
            duration: const Duration(seconds: 1),
            child: child,
          );
        },
    errorBuilder: errorBuilder ??
        (context, error, stackTrace) {
          return const Icon(
            Icons.broken_image,
            size: 50,
            color: myTurquois,
          );
        },
  );
}

Widget imageFile(
  File file, {
  Key? key,
  AssetBundle? bundle,
  Widget Function(BuildContext, Widget, int?, bool)? frameBuilder,
  Widget Function(BuildContext, Object, StackTrace?)? errorBuilder,
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
  FilterQuality filterQuality = FilterQuality.medium,
  int? cacheWidth,
  int? cacheHeight,
}) {
  return Image.file(
    file,
    width: width,
    height: height,
    fit: fit,
    color: color,
    alignment: alignment,
    scale: scale ?? 1,
    frameBuilder: frameBuilder ??
        (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            return child;
          }
          return AnimatedOpacity(
            opacity: frame == null ? 0 : 1,
            duration: const Duration(seconds: 1),
            child: child,
          );
        },
    errorBuilder: errorBuilder ??
        (context, error, stackTrace) {
          return const Icon(
            Icons.broken_image,
            size: 50,
            color: myTurquois,
          );
        },
  );
}

Widget lottieAsset(
  String name, {
  Key? key,
  Animation<double>? controller,
  bool? animate,
  FrameRate? frameRate,
  bool? repeat,
  bool? reverse,
  LottieDelegates? delegates,
  LottieOptions? options,
  void Function(LottieComposition)? onLoaded,
  ImageProvider<Object>? Function(LottieImageAsset)? imageProviderFactory,
  AssetBundle? bundle,
  Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder,
  Widget Function(BuildContext, Object, StackTrace?)? errorBuilder,
  double? width,
  double? height,
  BoxFit? fit,
  AlignmentGeometry? alignment,
  String? package,
  bool? addRepaintBoundary,
  FilterQuality? filterQuality,
  void Function(String)? onWarning,
  Future<LottieComposition?> Function(List<int>)? decoder,
  RenderCache? renderCache,
  bool? backgroundLoading,
}) {
  return Lottie.asset(
    name,
    width: width,
    height: height,
    fit: fit,
    alignment: alignment,
    frameBuilder: frameBuilder ??
        (context, child, lottieComposition) {
          return AnimatedOpacity(
            opacity: lottieComposition == null ? 0 : 1,
            duration: const Duration(seconds: 1),
            child: child,
          );
        },
    errorBuilder: errorBuilder ??
        (context, error, stackTrace) {
          return const Icon(
            Icons.broken_image,
            size: 50,
            color: myTurquois,
          );
        },
    animate: animate,
    controller: controller,
    frameRate: frameRate,
    repeat: repeat,
    reverse: reverse,
    delegates: delegates,
    options: options,
    onLoaded: onLoaded,
    imageProviderFactory: imageProviderFactory,
    bundle: bundle,
    package: package,
    addRepaintBoundary: addRepaintBoundary ?? true,
    filterQuality: filterQuality,
    onWarning: onWarning,
    decoder: decoder,
    renderCache: renderCache,
    backgroundLoading: backgroundLoading,
  );
}

Widget lottieNetwork(
  String name, {
  Key? key,
  Animation<double>? controller,
  bool? animate,
  FrameRate? frameRate,
  bool? repeat,
  bool? reverse,
  LottieDelegates? delegates,
  LottieOptions? options,
  void Function(LottieComposition)? onLoaded,
  ImageProvider<Object>? Function(LottieImageAsset)? imageProviderFactory,
  Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder,
  Widget Function(BuildContext, Object, StackTrace?)? errorBuilder,
  double? width,
  double? height,
  BoxFit? fit,
  AlignmentGeometry? alignment,
  bool? addRepaintBoundary,
  FilterQuality? filterQuality,
  void Function(String)? onWarning,
  Future<LottieComposition?> Function(List<int>)? decoder,
  RenderCache? renderCache,
  bool? backgroundLoading,
}) {
  return Lottie.network(
    name,
    width: width,
    height: height,
    fit: fit,
    alignment: alignment,
    frameBuilder: frameBuilder ??
        (context, child, lottieComposition) {
          return AnimatedOpacity(
            opacity: lottieComposition == null ? 0 : 1,
            duration: const Duration(seconds: 1),
            child: child,
          );
        },
    errorBuilder: errorBuilder ??
        (context, error, stackTrace) {
          return const Icon(
            Icons.broken_image,
            size: 50,
            color: myTurquois,
          );
        },
    animate: animate,
    controller: controller,
    frameRate: frameRate,
    repeat: repeat,
    reverse: reverse,
    delegates: delegates,
    options: options,
    onLoaded: onLoaded,
    imageProviderFactory: imageProviderFactory,
    addRepaintBoundary: addRepaintBoundary ?? true,
    filterQuality: filterQuality,
    onWarning: onWarning,
    decoder: decoder,
    renderCache: renderCache,
    backgroundLoading: backgroundLoading,
  );
}

Widget lottieFile(
  File file, {
  Key? key,
  Animation<double>? controller,
  bool? animate,
  FrameRate? frameRate,
  bool? repeat,
  bool? reverse,
  LottieDelegates? delegates,
  LottieOptions? options,
  void Function(LottieComposition)? onLoaded,
  ImageProvider<Object>? Function(LottieImageAsset)? imageProviderFactory,
  Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder,
  Widget Function(BuildContext, Object, StackTrace?)? errorBuilder,
  double? width,
  double? height,
  BoxFit? fit,
  AlignmentGeometry? alignment,
  bool? addRepaintBoundary,
  FilterQuality? filterQuality,
  void Function(String)? onWarning,
  Future<LottieComposition?> Function(List<int>)? decoder,
  RenderCache? renderCache,
  bool? backgroundLoading,
}) {
  return Lottie.file(
    file,
    width: width,
    height: height,
    fit: fit,
    alignment: alignment,
    frameBuilder: frameBuilder ??
        (context, child, lottieComposition) {
          return AnimatedOpacity(
            opacity: lottieComposition == null ? 0 : 1,
            duration: const Duration(seconds: 1),
            child: child,
          );
        },
    errorBuilder: errorBuilder ??
        (context, error, stackTrace) {
          return const Icon(
            Icons.broken_image,
            size: 50,
            color: myTurquois,
          );
        },
    animate: animate,
    controller: controller,
    frameRate: frameRate,
    repeat: repeat,
    reverse: reverse,
    delegates: delegates,
    options: options,
    onLoaded: onLoaded,
    imageProviderFactory: imageProviderFactory,
    addRepaintBoundary: addRepaintBoundary ?? true,
    filterQuality: filterQuality,
    onWarning: onWarning,
    decoder: decoder,
    renderCache: renderCache,
    backgroundLoading: backgroundLoading,
  );
}

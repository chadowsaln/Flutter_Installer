import 'package:flutter/material.dart';

class TextLink extends StatelessWidget {
  const TextLink(
    this.text, {
    super.key,
    this.onPressed,
    this.style,
    this.textAlign,
    this.overflow,
    this.strutStyle,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
  });

  final String text;
  final VoidCallback? onPressed;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        overflow: overflow,
        textAlign: textAlign,
        style: style,
        strutStyle: strutStyle,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
      ),
    );
  }
}
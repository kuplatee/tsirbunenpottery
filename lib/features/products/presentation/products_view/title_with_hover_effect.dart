import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

const double defaultIconFontWeight = 300;
const double hoveredIconFontWeight = 600;
const double borderRadius = 50.0;
const double leftMargin = 10.0;
const double leftPadding = 15.0;
const double arrowSpacer = 10.0;
const double verticalPadding = 10.0;
const EdgeInsets textWithoutArrowPadding = EdgeInsets.symmetric(
    horizontal: leftMargin + leftPadding, vertical: verticalPadding);
const EdgeInsets textWithArrowPadding =
    EdgeInsets.symmetric(horizontal: leftPadding, vertical: verticalPadding);

class TitleWithHoverEffect extends StatefulWidget {
  final String title;
  final void Function(BuildContext) onTap;
  final bool showEffect;

  const TitleWithHoverEffect({
    super.key,
    required this.title,
    required this.onTap,
    required this.showEffect,
  });

  @override
  TitleWithHoverEffectState createState() => TitleWithHoverEffectState();
}

class TitleWithHoverEffectState extends State<TitleWithHoverEffect> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    if (!widget.showEffect) {
      return Padding(
        padding: textWithoutArrowPadding,
        child: Text(
          widget.title,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          style: _titleStyle(context),
        ),
      );
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        margin: const EdgeInsets.only(left: leftMargin),
        child: GestureDetector(
          onTap: () => widget.onTap(context),
          child: Padding(
            padding: textWithArrowPadding,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                    child: Text(widget.title,
                        style: _titleStyle(context),
                        overflow: TextOverflow.ellipsis,
                        softWrap: false)),
                const SizedBox(width: arrowSpacer),
                Icon(
                  Symbols.arrow_forward,
                  color: color,
                  weight: _isHovered
                      ? hoveredIconFontWeight
                      : defaultIconFontWeight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _titleStyle(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      fontWeight: _isHovered ? FontWeight.w700 : FontWeight.w500,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}

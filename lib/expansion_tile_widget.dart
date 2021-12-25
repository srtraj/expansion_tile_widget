library expansion_tile_widget;

import 'package:flutter/material.dart';

class CustomExpansionTileWidget extends StatefulWidget {
  const CustomExpansionTileWidget(
      {Key? key,
      this.leading,
      this.headerTileColor,
      required this.headerTitle,
      this.headerDecoration,
      this.headerPadding,
      this.headerHeight,
      this.headerTextStyle,
      this.headerTrailing,
      this.isHeaderTrailingAnimation = true,
      this.animationDuration,
      this.onExpansionChanged,
      this.children = const <Widget>[],
      this.initiallyExpanded = false,
      this.textColor,
      this.paddingBetweenHeaderAndChildren})
      : super(key: key);

  final Widget? leading;
  final String headerTitle;
  final Decoration? headerDecoration;
  final EdgeInsets? headerPadding;
  final double? headerHeight;
  final TextStyle? headerTextStyle;
  final ValueChanged<bool>? onExpansionChanged;
  final List<Widget> children;
  final Color? headerTileColor;
  final Widget? headerTrailing;
  final bool isHeaderTrailingAnimation;
  final bool initiallyExpanded;
  final Color? textColor;
  final EdgeInsets? paddingBetweenHeaderAndChildren;
  final Duration? animationDuration;

  @override
  State<CustomExpansionTileWidget> createState() =>
      _CustomExpansionTileWidgetState();
}

class _CustomExpansionTileWidgetState extends State<CustomExpansionTileWidget>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: widget.animationDuration ?? const Duration(milliseconds: 200),
        vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));

    _isExpanded = widget.initiallyExpanded;
    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
    widget.onExpansionChanged?.call(_isExpanded);
  }

  Widget? _buildIcon(context, child) {
    return RotationTransition(turns: _iconTurns, child: child);
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: widget.headerHeight ?? 50,
          decoration: widget.headerDecoration ??
              BoxDecoration(
                color: widget.headerTileColor ?? Colors.lightBlueAccent,
              ),
          padding: widget.headerPadding ?? EdgeInsets.zero,
          child: Center(
            child: ListTileTheme.merge(
              child: ListTile(
                  onTap: _handleTap,
                  leading: widget.leading,
                  title: Text(
                    widget.headerTitle,
                    style: widget.headerTextStyle,
                  ),
                  trailing: widget.headerTrailing != null
                      ? widget.isHeaderTrailingAnimation
                          ? _buildIcon(context, widget.headerTrailing)
                          : widget.headerTrailing
                      : _buildIcon(
                          context,
                          const Icon(Icons.expand_more),
                        )),
            ),
          ),
        ),
        ClipRect(
          child: Align(
            alignment: Alignment.center,
            heightFactor: _heightFactor.value,
            child: Padding(
              padding:
                  widget.paddingBetweenHeaderAndChildren ?? EdgeInsets.zero,
              child: Column(
                children: widget.children,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
    );
  }
}

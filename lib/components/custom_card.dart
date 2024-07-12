import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.child,
    this.cardColor,
    this.shadowColor,
    this.isPrimary = false,
    this.isPaddingEnabled = true,
  });

  final Widget? child;
  final bool isPrimary;
  final bool isPaddingEnabled;
  final Color? cardColor;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(4),
      padding: isPaddingEnabled ? const EdgeInsets.all(16.0) : null,
      decoration: BoxDecoration(
        color: cardColor ??
            (isPrimary ? theme.primaryColor : theme.cardColor),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: shadowColor ??
                (isPrimary ? theme.primaryColorDark : theme.shadowColor),
            blurRadius: isPrimary ? 1 : 4,
            offset: const Offset(0, 1) * (isPrimary ? 3 : 2),
          )
        ],
      ),
      alignment: Alignment.topCenter,
      child: child,
    );
  }
}

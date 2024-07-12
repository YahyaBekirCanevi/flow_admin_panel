import 'package:flow_admin_panel/pages/home/index.dart';
import 'package:flutter/material.dart';

class CircularProgressBar extends StatelessWidget {
  const CircularProgressBar({
    super.key,
    required this.progressColor,
    required this.progress,
    required this.textColor,
  });
  final double progress;
  final Color progressColor;
  final Color textColor;

  final Color lineColor = const Color(0xFFE0E3E7);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(
        height: 140,
        width: 140,
      ),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: CircularProgressIndicator(
                backgroundColor: lineColor,
                color: progressColor,
                strokeWidth: 12,
                value: progress,
              ),
            ),
            Center(
              child: Text(
                '${(progress * 100).toStringAsFixed(0)}%',
                style: headerTextStyle.copyWith(color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flow_admin_panel/components/custom_card.dart';
import 'package:flow_admin_panel/config/theme.dart';
import 'package:flow_admin_panel/pages/home/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeSummary extends StatelessWidget {
  const HomeSummary({super.key});

  final String header1 = 'Course Summary';
  final String header2 = 'An overview of your courses.';

  @override
  Widget build(BuildContext context) {
    final AppTheme provider = Provider.of<AppTheme>(context);
    final Color textColor = provider.isLightMode ? Colors.black : Colors.white;
    return CustomCard(
      child: SizedBox(
        height: 256,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header1,
              style: headerTextStyle.copyWith(color: textColor),
            ),
            const SizedBox(height: 4),
            Text(
              header2,
              style: secondaryTextStyle.copyWith(color: textColor),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircularProgressBar(
                      progressColor: const Color(0xFFF19642),
                      progress: 0.23,
                      textColor: textColor,
                    ),
                    CircularProgressBar(
                      progressColor: const Color(0xFF4741FF),
                      progress: 0.93,
                      textColor: textColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

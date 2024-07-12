import 'package:flow_admin_panel/config/theme.dart';
import 'package:flow_admin_panel/pages/home/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  final String header1 = 'Dashboard';
  final String header2 = 'Your Project status is appearing here';

  @override
  Widget build(BuildContext context) {
    final AppTheme provider = Provider.of<AppTheme>(context);
    final Color textColor = provider.isLightMode ? Colors.black : Colors.white;
    final IconData iconData =
        provider.isLightMode ? Icons.dark_mode : Icons.light_mode;
    return Padding(
      padding: const EdgeInsets.only(top: 64, left: 16, right: 16, bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  header1,
                  style: headerTextStyle.copyWith(color: textColor),
                  textAlign: TextAlign.start,
                ),
                Text(
                  header2,
                  style: secondaryTextStyle.copyWith(color: textColor),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () async => await provider.toggleTheme(),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(iconData, color: Theme.of(context).scaffoldBackgroundColor, size: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

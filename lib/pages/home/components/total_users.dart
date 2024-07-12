import 'package:flow_admin_panel/components/custom_card.dart';
import 'package:flow_admin_panel/config/theme.dart';
import 'package:flow_admin_panel/pages/home/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTotalUsers extends StatelessWidget {
  const HomeTotalUsers({super.key});

  final String header1 = "Total User Count";
  final String header2 = "An overview of all your users on your platform";

  @override
  Widget build(BuildContext context) {
    final AppTheme provider = Provider.of<AppTheme>(context);
    final Color textColor = provider.isLightMode ? Colors.black : Colors.white;
    return CustomCard(
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
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.supervisor_account_rounded,
                  color: Theme.of(context).primaryColor,
                  size: 44,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    "56.4k",
                    style: headerTextStyle.copyWith(
                      color: textColor,
                      fontSize: 32,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

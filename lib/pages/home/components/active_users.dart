import 'package:flow_admin_panel/components/custom_card.dart';
import 'package:flow_admin_panel/pages/home/index.dart';
import 'package:flutter/material.dart';

class HomeActiveUsers extends StatelessWidget {
  const HomeActiveUsers({super.key});

  final String header1 = "Active Users";
  final String header2 = "A small summary of your users base";

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      isPrimary: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            header1,
            style: headerTextStyle.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 4.0),
          Text(
            header2,
            style: secondaryTextStyle.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 12.0),
          LinearProgressIndicator(
            value: 0.2,
            color: Colors.white,
            backgroundColor: Colors.white.withOpacity(0.5),
            minHeight: 16.0,
            borderRadius: BorderRadius.circular(6.0),
          ),
        ],
      ),
    );
  }
}

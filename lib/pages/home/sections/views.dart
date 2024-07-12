import 'package:flutter/material.dart';
import 'package:flow_admin_panel/pages/home/index.dart';

class HomeViews extends StatelessWidget {
  const HomeViews({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HomeActiveUsers(),
        SizedBox(height: 4),
        HomeTotalUsers(),
        HomeUserList(),
      ],
    );
  }
}

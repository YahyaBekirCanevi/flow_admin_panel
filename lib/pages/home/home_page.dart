import 'package:flutter/material.dart';
import 'package:flow_admin_panel/pages/home/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeTitle(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  HomeSummary(),
                  HomeViews(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

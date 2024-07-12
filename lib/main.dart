import 'package:flow_admin_panel/config/theme.dart';
import 'package:flow_admin_panel/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppTheme(context),
      child: Consumer<AppTheme>(
        builder: (context, provider, child) {
          Future.microtask(() async {
            final isLightMode = await AppTheme.getLightMode();
            provider.setLightMode(isLightMode);
          });
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: provider.theme,
            home: const HomePage(),
          );
        }
      ),
    );
  }
}

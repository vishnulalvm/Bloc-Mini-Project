import 'package:flutter/material.dart';
import 'package:myapp/application/core/services/theme_service.dart';
import 'package:myapp/application/pages/posts/post_page.dart';
import 'package:myapp/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeServiceProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeServiceProvider>(
        builder: (context, themeService, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheme.darkTheme,

        themeMode: themeService.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        home: const PostWrapper(),
      );
    });
  }
}

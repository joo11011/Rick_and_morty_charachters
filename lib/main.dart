// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_with_omar_ahmed/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(RickAndMorty(appRoutes: AppRoutes(),));
}

class RickAndMorty extends StatelessWidget {
  final AppRoutes appRoutes;
  const RickAndMorty({
    Key? key,
    required this.appRoutes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoutes.generateRoute,
    );
  }
}


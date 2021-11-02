import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_application_1/theme/routes.dart';
import 'package:flutter_application_1/views/auth/opening_view.dart';
import 'package:flutter_application_1/services/config.dart';

void main() async {
  await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClientProvider(
      uri: "https://demo.saleor.io/graphql/",
      child: MaterialApp(
        title: 'Opening View Demo',
        routes: AppRoutes.define(),
        home: const Opening(),
      ),
    );
  }
}

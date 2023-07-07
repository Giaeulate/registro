import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'provider/register_provider.dart';
import 'routes/application_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => RegisterProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Registro',
        debugShowCheckedModeBanner: false,
        routes: getApplicationRoutes(),
        initialRoute: 'register_page',
        theme: ApplicationTheme.getApplicationTheme(),
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const <Locale>[
          Locale('es'),
          Locale('en'),
        ],
        locale: const Locale('es'),
      ),
    );
  }
}

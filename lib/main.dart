import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/cubit/connection/bloc/connected_bloc.dart';
import 'package:portfolio/cubit/connection/network_check.dart';
import 'package:portfolio/cubit/language/language_cubit.dart';
import 'package:portfolio/cubit/scroll/scroll_cubit.dart';
import 'package:portfolio/cubit/theme/theme_cubit.dart';
import 'package:portfolio/core/localization/app_local.dart';
import 'package:portfolio/features/about_me/presentation/about_me_screen.dart';
import 'package:portfolio/core/utils/flutter_secure_storage_utils.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/features/contacts/presentation/contacts_screen.dart';
import 'package:portfolio/features/portfolio/presentation/portfolio_screen.dart';
import 'package:portfolio/features/services_offered/presentation/services_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:url_strategy/url_strategy.dart'; 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterLocalization.instance.ensureInitialized();

  await FlutterSecureStorageUtils.initApp();
  await FlutterSecureStorageUtils.initThemeMode();

  setPathUrlStrategy();

  runApp(
    MainApp(),
  );
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return NetworkChecking();
      },
    ),
    GoRoute(
      path: '/about_me',
      builder: (BuildContext context, GoRouterState state) {
        return AboutMeScreen();
      },
    ),
    GoRoute(
      path: '/services',
      builder: (BuildContext context, GoRouterState state) {
        return ServicesScreen();
      },
    ),
    GoRoute(
      path: '/contacts',
      builder: (BuildContext context, GoRouterState state) {
        return ContactsScreen();
      },
    ),
    GoRoute(
      path: '/portfolio',
      builder: (BuildContext context, GoRouterState state) {
        return PortfolioScreen();
      },
    ),
  ],
);

class MainApp extends StatefulWidget {
  const MainApp({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  final theme = CustomAppTheme.instance;

  @override
  void initState() {
    super.initState();
    _localization.init(
      mapLocales: [
        const MapLocale(
          'en',
          AppLocale.EN,
          countryCode: 'US',
        ),
        const MapLocale(
          'fr',
          AppLocale.FR,
          countryCode: 'FR',
        ),
        const MapLocale(
          'es',
          AppLocale.ES,
          countryCode: 'ES',
        ),
      ],
      initLanguageCode: "fr",
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit()..init(),
        ),
        BlocProvider<ConnectedBloc>(
          create: (context) => ConnectedBloc(),
        ),
        BlocProvider<ScrollCubit>(
          create: (context) => ScrollCubit(),
        ),
        BlocProvider<DrawerCubit>(
          create: (context) => DrawerCubit(),
        ),
        BlocProvider<SelectedIndexCubit>(
          create: (context) => SelectedIndexCubit(),
        ),
        BlocProvider<LanguageCubit>(
          create: (context) => LanguageCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return Sizer(builder: (context, orientation, deviceType) {
            return MaterialApp.router(
              localizationsDelegates: _localization.localizationsDelegates,
              supportedLocales: const [
                Locale('en'),
                Locale('fr'),
                Locale('es'),
              ],
              themeMode: context.watch<ThemeCubit>().state,
              theme: theme.lightTheme,
              darkTheme: theme.darkTheme,
              debugShowCheckedModeBanner: false,
              routerConfig: _router,
            );
          });
        },
      ),
    );
  }
}

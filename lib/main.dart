import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noti_app/config/constants/environment.dart';
import 'package:noti_app/config/router/app_router.dart';
import 'package:noti_app/config/theme/app_theme.dart';

import 'features/news/infrastructure/models/models_container.dart';
import 'features/news/infrastructure/repositories/news_repository_impl.dart';
import 'features/news/presentation/bloc/bloc_container.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(SourceModelAdapter());
  Hive.registerAdapter(ArticleModelAdapter());

  await Hive.openBox<ArticleModel>('favorites');
  await Environment.initEnvironment();
  
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsBloc( NewsRepositoryImpl(), )),
        BlocProvider(create: (context) => FavoritesBloc( Hive.box('favorites') )),
        BlocProvider(create: (context) => SearchBloc( NewsRepositoryImpl() )),
      ],
      child: const MainApp()
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      title: 'Noticias App',
      theme: AppTheme.getTheme(context),
    );
  }
}

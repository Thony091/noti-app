import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:noti_app/config/constants/Environment.dart';
import 'package:noti_app/config/router/app_router.dart';

import 'features/news/infrastructure/repositories/news_repository_impl.dart';
import 'features/news/presentation/bloc/bloc_container.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // await Environment.initEnvironment();
  
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsBloc( NewsRepositoryImpl(), )),
        BlocProvider(create: (context) => FavoritesBloc())
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
    );
  }
}

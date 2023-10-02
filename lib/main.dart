import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jot_down/config/di/injection.dart';
import 'package:jot_down/config/route/app_routes.dart';
import 'package:jot_down/config/theme/color_schemes.g.dart';
import 'package:jot_down/domain/model/note.dart';
import 'package:jot_down/framework/presentation/home/bloc/home_bloc.dart';
import 'package:jot_down/framework/presentation/home/home_page.dart';
import 'package:jot_down/framework/presentation/note_detail/NoteDetailPage.dart';
import 'package:jot_down/framework/presentation/note_detail/bloc/note_detail_bloc.dart';

void main() {
  configureDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<HomeBloc>()),
        BlocProvider.value(value: getIt<NoteDetailBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      // darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.home:
            return MaterialPageRoute(builder: (_) => const HomePage());
          case AppRoutes.noteDetails:
            final Note? note = settings.arguments as Note?;
            return MaterialPageRoute(
                builder: (_) => NoteDetailPage(
                      note: note,
                    ));
          default:
            return null;
        }
      },
      title: 'JotDown',
      home: const HomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/auth/persentation/bloc/auth_block.dart';
import 'app/book_ticket/persentation/bloc/book_ticket_bloc.dart';
import 'app/book_ticket/persentation/bloc/book_ticket_event.dart';
import 'app/history/persentation/bloc/local/local_history_bloc.dart';
import 'app/history/persentation/bloc/local/local_history_event.dart';
import 'app/movies/persentation/bloc/movies_bloc.dart';
import 'app/movies/persentation/bloc/movies_event.dart';
import 'config/routes/routes.dart';
import 'dep_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => sl()),
        BlocProvider<MoviesBloc>(
          create: (context) => sl()..add(const GetMovies()),
        ),
        BlocProvider<BookTicketBloc>(
          create: (context) => sl()..add(const GetTicketsDetailEvent()),
        ),
        BlocProvider<LocalHistoryBloc>(
          create: (context) => sl()..add(const GetLocalHistoryEvent()),
        ),
      ],
      child: ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark(),
              routerConfig: AR.router,
            );
          }),
    );
  }
}

import 'package:get_it/get_it.dart';
import 'package:local_storage/app/history/domain/usecases/read_search_history_usecase.dart';
import 'package:local_storage/core/api/api_service.dart';
import 'app/auth/data/data_source/local/SQF/auth_sqf.dart';
import 'app/auth/data/repository/user_repository_imp.dart';
import 'app/auth/domain/repository/user_repository.dart';
import 'app/auth/domain/usecases/register_user.dart';
import 'app/auth/domain/usecases/get_user.dart';
import 'app/auth/domain/usecases/signin_user.dart';
import 'app/auth/domain/usecases/signout_user.dart';
import 'app/auth/persentation/bloc/auth_block.dart';
import 'app/book_ticket/data/data_source/local/book_ticket_service.dart';
import 'app/book_ticket/data/repository/book_ticket_repository_imp.dart';
import 'app/book_ticket/domain/repository/book_ticket_repository.dart';
import 'app/book_ticket/domain/usecases/delete_movies_from_db_usercase.dart';
import 'app/book_ticket/domain/usecases/get_tickets_from_db_usecase.dart';
import 'app/book_ticket/domain/usecases/insert_ticket_in_db_usecase.dart';
import 'app/book_ticket/persentation/bloc/book_ticket_bloc.dart';
import 'app/details/data/data_source/remote/movie_detail_api_service.dart';
import 'app/details/data/repository/movie_detail_repository_imp.dart';
import 'app/details/domain/repository/movies_detail_repository.dart';
import 'app/details/domain/usecase/get_movie_detail_usecase.dart';
import 'app/details/persentation/bloc/details_bloc.dart';
import 'app/history/data/data_source/local/search_history_local_service.dart';
import 'app/history/data/repository/search_history_repository_impl.dart';
import 'app/history/domain/repository/search_history_repository.dart';
import 'app/history/domain/usecases/delete_search_history_usecase.dart';
import 'app/history/domain/usecases/save_search_history_usecase.dart';
import 'app/history/persentation/bloc/local/local_history_bloc.dart';
import 'app/movies/data/data_source/remote/movie_api_service.dart';
import 'app/movies/data/repository/movie_repository_imp.dart';
import 'app/movies/domain/repository/movies_repository.dart';
import 'app/movies/domain/usecase/get_movies_usecase.dart';
import 'app/movies/persentation/bloc/movies_bloc.dart';
import 'app/search/data/data_source/remote/search_api_service.dart';
import 'app/search/data/repository/search_repository_imp.dart';
import 'app/search/domain/repository/search_repository.dart';
import 'app/search/domain/usecase/get_search_result_usecase.dart';
import 'app/search/persentation/bloc/search_bloc.dart';
import 'core/utils/debouncer.dart';
// import 'core/api/api_service.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  /// Dependencies
  // sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<Debouncer>(Debouncer());
  sl.registerSingleton<DioService>(DioService());
  sl.registerSingleton<AuthSqf>(AuthSqf());
  sl.registerSingleton<UserReository>(UserRepositoryImp(sl()));

  /// Movies
  sl.registerSingleton<MovieApiService>(
      MovieApiService(dio: sl<DioService>().dio));
  sl.registerSingleton<MoviesRepository>(
      MovieRepositoryImp(movieApiService: sl()));

  /// Search Movies
  sl.registerSingleton<SearchApiService>(
      SearchApiService(dio: sl<DioService>().dio));
  sl.registerSingleton<SearchRepository>(
      SearchRepositoryImp(searchApiService: sl()));

  /// Detail
  sl.registerSingleton<MovieDetailApiService>(
      MovieDetailApiService(dio: sl<DioService>().dio));
  sl.registerSingleton<MovieDetailRepository>(
      MovieDetailRepositoryImp(movieDetailApiService: sl()));

  /// Book Ticket
  sl.registerSingleton<BookTicketService>(BookTicketService());
  sl.registerSingleton<BookTicketRepository>(BookTicketRepositoryImp(sl()));

  /// History
  sl.registerSingleton<SearchHistoryDatabase>(SearchHistoryLocalService());
  sl.registerSingleton<SearchHistoryRepository>(
      SearchHistoryRepositoryImpl(sl()));

  /// use case
  sl.registerSingleton<RegisterUser>(RegisterUser(sl()));
  sl.registerSingleton<GetUser>(GetUser(sl()));
  sl.registerSingleton<SignInUser>(SignInUser(sl()));
  sl.registerSingleton<SignOutUser>(SignOutUser(sl()));
  sl.registerSingleton<InsertTicketINDBUserCase>(
      InsertTicketINDBUserCase(sl()));
  sl.registerSingleton<GetTicketsFromDBUserCase>(
      GetTicketsFromDBUserCase(sl()));
  sl.registerSingleton<DeleteMoviesFromDB>(DeleteMoviesFromDB(sl()));

  // sl.registerLazySingleton<GetMoviesUserCase>(() => GetMoviesUserCase(sl()));
  sl.registerSingleton<GetMoviesUserCase>(GetMoviesUserCase(sl()));

  sl.registerSingleton<GetMoviesDetailUserCase>(
      GetMoviesDetailUserCase(movieDetailRepository: sl()));
  sl.registerSingleton<GetSearchResultUsecase>(GetSearchResultUsecase(sl()));

  sl.registerSingleton<ReadSearchHistoryUsecase>(
      ReadSearchHistoryUsecase(sl()));
  sl.registerSingleton<SaveSearchHistoryUsecase>(
      SaveSearchHistoryUsecase(sl()));
  sl.registerSingleton<DeleteSearchHistoryUsecase>(
      DeleteSearchHistoryUsecase(sl()));

  /// Bloc
  sl.registerFactory<AuthBloc>(() => AuthBloc(
      getUser: sl(), signInUser: sl(), signOutUser: sl(), registerUser: sl()));
  sl.registerFactory<MoviesBloc>(() => MoviesBloc(sl()));
  sl.registerFactory<DetailsBloc>(() => DetailsBloc(sl()));
  sl.registerFactory<BookTicketBloc>(() => BookTicketBloc(sl(), sl(), sl()));

  sl.registerFactory<SearchBloc>(() => SearchBloc(sl()));
  sl.registerFactory<LocalHistoryBloc>(() => LocalHistoryBloc(sl(), sl(),sl()));
}

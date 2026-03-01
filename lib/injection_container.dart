import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/portfolio/data/datasources/portfolio_remote_data_source.dart';
import 'features/portfolio/data/datasources/portfolio_remote_data_source_impl.dart';
import 'features/portfolio/data/repositories/portfolio_repository_impl.dart';
import 'features/portfolio/domain/repositories/i_portfolio_repository.dart';
import 'features/portfolio/domain/usecases/get_portfolio_data.dart';
import 'features/portfolio/domain/usecases/get_saved_portfolio_data.dart'; // Import corrigido
import 'features/portfolio/presentation/bloc/portfolio_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // 1. Core
  sl.registerLazySingleton<Dio>(() => Dio());

  // 2. Data Sources
  sl.registerLazySingleton<IPortfolioRemoteDataSource>(
    () => PortfolioRemoteDataSourceImpl(dio: sl()),
  );

  // 3. Repositórios
  sl.registerLazySingleton<IPortfolioRepository>(
    () => PortfolioRepositoryImpl(sl()),
  );

  // 4. Casos de Uso
  sl.registerLazySingleton(() => GetPortfolioData(sl()));
  sl.registerLazySingleton(() => GetSavedPortfolioData(sl())); // O novo Caso de Uso registrado

  // 5. Blocs
  sl.registerFactory(() => PortfolioBloc(
        getPortfolioData: sl(),
        getSavedPortfolioData: sl(),
      ));
}
import 'package:anthony_news_apps/Domain/Repository/authentication_repository.dart';
import 'package:get_it/get_it.dart';

import 'Presentation/Bloc/Authenticatio_bloc/auth_bloc.dart';


final locator = GetIt.instance;


void init(){
  ///bloc
  locator.registerLazySingleton<AuthRepository>(() => AuthRepository());
  locator.registerLazySingleton<AuthBloc>(() => AuthBloc(locator<AuthRepository>()));

  ///usecase
}
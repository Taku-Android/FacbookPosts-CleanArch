import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_posts_clean_arch/core/network/internet_checker.dart';
import 'package:my_posts_clean_arch/features/posts/data/data_source/post_local_data_source.dart';
import 'package:my_posts_clean_arch/features/posts/data/data_source/post_remote_data_source.dart';
import 'package:my_posts_clean_arch/features/posts/data/repository/post_repository_impl.dart';
import 'package:my_posts_clean_arch/features/posts/domain/repository/post_repository.dart';
import 'package:my_posts_clean_arch/features/posts/domain/usecases/add_post_usecase.dart';
import 'package:my_posts_clean_arch/features/posts/domain/usecases/delete_post_usecase.dart';
import 'package:my_posts_clean_arch/features/posts/domain/usecases/get_all_posts_usecase.dart';
import 'package:my_posts_clean_arch/features/posts/domain/usecases/update_post_usecase.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/bloc/add_post/add_post_cubit.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/bloc/delete_post/delete_post_cubit.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/bloc/get_all_posts_bloc/get_all_posts_cubit.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/bloc/update_post/update_post_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';


final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {

  // Bloc
  
  getIt.registerFactory(() => GetAllPostsCubit(
    getIt()
  ));

  getIt.registerFactory(() => AddPostCubit(
      getIt()
  ));

  getIt.registerFactory(() => DeletePostCubit(
      getIt()
  ));

  getIt.registerFactory(() => UpdatePostCubit(
      getIt()
  ));

  // UseCase

 getIt.registerLazySingleton(() =>
    GetAllPostsUseCase(
      getIt()
    )
 );

  getIt.registerLazySingleton(() =>
      AddPostUseCase(
          getIt()
      )
  );

  getIt.registerLazySingleton(() =>
      DeletePostUseCase(
          getIt()
      )
  );

  getIt.registerLazySingleton(() =>
      UpdatePostUseCase(
          getIt()
      )
  );


  // repo

  getIt.registerLazySingleton<PostRepo>(() =>
      PostRepositoryImpl(
          getIt() ,
        postRemoteDataSource: getIt() ,
        postLocalDataSource: getIt() ,
      )
  );


  // Data Source

  getIt.registerLazySingleton<PostLocalDataSource>(() =>
      PostLocalDataSourceImpl(
          sharedPreferences : getIt()
      )
  );

  getIt.registerLazySingleton<PostRemoteDataSource>(() =>
      PostRemoteDataSourceImpl(
          getIt()
      )
  );

  // Core

  getIt.registerLazySingleton<InternetChecker>(() =>
      InternetCheckerImpl(
          getIt()
      )
  );


  // External Packages

  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton(() => sharedPreferences);

  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => InternetConnectionChecker());




}

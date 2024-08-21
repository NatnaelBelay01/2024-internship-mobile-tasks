import 'package:ecommerce/core/platform/network_info.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/features/product/data/datasources/product_local_data_source.dart';
import 'package:ecommerce/features/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce/features/product/data/repositories/productrepositoriesimp.dart';
import 'package:ecommerce/features/product/domain/repositories/productrepositories.dart';
import 'package:ecommerce/features/product/domain/use_cases/deleteproduct.dart';
import 'package:ecommerce/features/product/domain/use_cases/getallproduct.dart';
import 'package:ecommerce/features/product/domain/use_cases/getproduct.dart';
import 'package:ecommerce/features/product/domain/use_cases/insertproduct.dart';
import 'package:ecommerce/features/product/domain/use_cases/updateproduct.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

void init() {
  //! Features
  //Bloc

  sl.registerFactory(() => ProductBloc(
        createProduct: sl(),
        updateProduct: sl(),
        deleteProduct: sl(),
        getProduct: sl(),
        getallProduct: sl(),
      ));
  //use_cases
  sl.registerLazySingleton(() => Insertproduct(productrepo: sl()));
  sl.registerLazySingleton(() => UpdateProduct(productRepo: sl()));
  sl.registerLazySingleton(() => DeleteProduct(productrepo: sl()));
  sl.registerLazySingleton(() => GetProduct(productrepo: sl()));
  sl.registerLazySingleton(() => GetAllProduct(productrepo: sl()));
  //Repository
  sl.registerLazySingleton<ProductRepositories>(() => ProductRepositoryImp(
        remotedatasource: sl(),
        localdatasource: sl(),
        networkinfo: sl(),
      ));
  //Datasources
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImp(client: sl()));
  sl.registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSourceImpl(sharedPreferences: sl()));
  //! core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(internetconnection: sl()));
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingletonAsync<SharedPreferences>(() async {
    final sharedprefs = SharedPreferences.getInstance();
    return sharedprefs;
  });

  //! External
}

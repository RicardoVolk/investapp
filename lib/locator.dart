import 'package:financy_app/common/features/balance/balance_controller.dart';
import 'package:financy_app/common/features/transaction/transaction_controller.dart';
import 'package:financy_app/features/forgot_password/forgot_password_controller.dart';
import 'package:financy_app/features/home/home_controller.dart';
import 'package:financy_app/features/profile/profile_controller.dart';
import 'package:financy_app/features/splash/splash.dart';
import 'package:financy_app/features/stats/stats_controller.dart';
import 'package:financy_app/features/wallet/wallet_controller.dart';
import 'package:financy_app/repositories/transaction_repository.dart';
import 'package:financy_app/repositories/transaction_repository_impl.dart';
import 'package:financy_app/services/auth_service/auth_service.dart';
import 'package:financy_app/services/auth_service/firebase_auth_service.dart';
import 'package:financy_app/services/connection_service.dart';
import 'package:financy_app/services/data_service/database_service.dart';
import 'package:financy_app/services/data_service/graphql_service.dart';
import 'package:financy_app/services/secure_storage.dart';
import 'package:financy_app/services/sync_service/sync_service.dart';
import 'package:financy_app/services/user_data_service/user_data_service.dart';
import 'package:financy_app/services/user_data_service/user_data_service_impl.dart';

import 'features/sign_in/sign_in.dart';
import 'features/sign_up/sign_up_controller.dart';

final locator = GetIt.instance;

void setupDependencies() {
  //Register Services
  locator.registerFactory<AuthService>(
    () => FirebaseAuthService(),
  );

  locator.registerFactory<SecureStorageService>(
      () => const SecureStorageService());

  locator.registerFactory<ConnectionService>(() => const ConnectionService());

  locator.registerSingletonAsync<GraphQLService>(
    () async => GraphQLService(
      authService: locator.get<AuthService>(),
    ).init(),
  );

  locator.registerSingletonAsync<DatabaseService>(
    () async => DatabaseService().init(),
  );

  locator.registerFactory<SyncService>(
    () => SyncService(
      connectionService: locator.get<ConnectionService>(),
      databaseService: locator.get<DatabaseService>(),
      graphQLService: locator.get<GraphQLService>(),
      secureStorageService: locator.get<SecureStorageService>(),
    ),
  );

  locator.registerFactory<UserDataService>(() => UserDataServiceImpl(
        firebaseAuth: FirebaseAuth.instance,
        firebaseFunctions: FirebaseFunctions.instance,
      ));

  //Register Repositories

  locator.registerFactory<TransactionRepository>(
    () => TransactionRepositoryImpl(
      databaseService: locator.get<DatabaseService>(),
      syncService: locator.get<SyncService>(),
    ),
  );

  //Register Controllers

  locator.registerFactory<SplashController>(
    () => SplashController(
      secureStorageService: locator.get<SecureStorageService>(),
    ),
  );

  locator.registerFactory<SignInController>(
    () => SignInController(
      authService: locator.get<AuthService>(),
      secureStorageService: locator.get<SecureStorageService>(),
    ),
  );

  locator.registerFactory<SignUpController>(
    () => SignUpController(
      authService: locator.get<AuthService>(),
      secureStorageService: locator.get<SecureStorageService>(),
    ),
  );

  locator.registerFactory<ForgotPasswordController>(
    () => ForgotPasswordController(authService: locator.get<AuthService>()),
  );

  locator.registerLazySingleton<HomeController>(
    () => HomeController(
      transactionRepository: locator.get<TransactionRepository>(),
      userDataService: locator.get<UserDataService>(),
    ),
  );

  locator.registerLazySingleton<WalletController>(
    () => WalletController(
      transactionRepository: locator.get<TransactionRepository>(),
    ),
  );

  locator.registerLazySingleton<BalanceController>(
    () => BalanceController(
      transactionRepository: locator.get<TransactionRepository>(),
    ),
  );

  locator.registerLazySingleton<TransactionController>(
    () => TransactionController(
      transactionRepository: locator.get<TransactionRepository>(),
      secureStorageService: locator.get<SecureStorageService>(),
    ),
  );

  locator.registerFactory<SyncController>(
    () => SyncController(
      syncService: locator.get<SyncService>(),
    ),
  );

  locator.registerFactory<ProfileController>(
      () => ProfileController(userDataService: locator.get<UserDataService>()));

  locator.registerLazySingleton<StatsController>(() => StatsController(
      transactionRepository: locator.get<TransactionRepository>()));
}

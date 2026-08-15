// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_installer/src/app/services/api/api_service.dart'
    as _i450;
import 'package:flutter_installer/src/app/services/local_storage_service.dart'
    as _i44;
import 'package:flutter_installer/src/app/services/router_service.dart'
    as _i725;
import 'package:flutter_installer/src/app/services/shared_prefs/shared_prefs_service.dart'
    as _i711;
import 'package:flutter_installer/src/app/services/third_party_services_module.dart'
    as _i1013;
import 'package:flutter_installer/src/app/services/window_size_service.dart'
    as _i730;
import 'package:flutter_installer/src/app/utils/utils.dart' as _i430;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:stacked_services/stacked_services.dart' as _i1055;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final thirdPartyServicesModule = _$ThirdPartyServicesModule();
    gh.factory<_i730.WindowSizeService>(() => _i730.WindowSizeService());
    gh.lazySingleton<_i450.ApiService>(() => _i450.ApiService());
    gh.lazySingleton<_i44.LocalStorageService>(
      () => _i44.LocalStorageService(),
    );
    gh.lazySingleton<_i725.RouterService>(() => _i725.RouterService());
    gh.lazySingleton<_i711.SharedPrefsService>(
      () => _i711.SharedPrefsService(),
    );
    gh.lazySingleton<_i1055.NavigationService>(
      () => thirdPartyServicesModule.navigationService,
    );
    gh.lazySingleton<_i1055.DialogService>(
      () => thirdPartyServicesModule.dialogService,
    );
    gh.lazySingleton<_i1055.SnackbarService>(
      () => thirdPartyServicesModule.snackBarService,
    );
    gh.lazySingleton<_i430.Utils>(() => _i430.Utils());
    return this;
  }
}

class _$ThirdPartyServicesModule extends _i1013.ThirdPartyServicesModule {
  @override
  _i1055.NavigationService get navigationService => _i1055.NavigationService();

  @override
  _i1055.DialogService get dialogService => _i1055.DialogService();

  @override
  _i1055.SnackbarService get snackBarService => _i1055.SnackbarService();
}

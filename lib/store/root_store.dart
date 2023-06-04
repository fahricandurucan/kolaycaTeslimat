
import 'package:kolayca_teslimat/store/auth_store.dart';
import 'package:kolayca_teslimat/store/package_store.dart';
import 'package:kolayca_teslimat/pages/theme_store.dart';
import 'package:mobx/mobx.dart';

part 'root_store.g.dart';

class RootStore = _RootStore with _$RootStore;

abstract class _RootStore with Store{

    _RootStore({
    required this.authStore,
    required this.themeStore,
    required this.packageStore,
});

    @observable
    late AuthStore authStore;

    @observable
    late ThemeStore themeStore;

    @observable
    late PackageStore packageStore;


}



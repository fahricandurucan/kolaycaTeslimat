// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  Computed<bool>? _$isLoginInComputed;

  @override
  bool get isLoginIn => (_$isLoginInComputed ??=
          Computed<bool>(() => super.isLoginIn, name: '_AuthStore.isLoginIn'))
      .value;

  late final _$userAtom = Atom(name: '_AuthStore.user', context: context);

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$_AuthStoreActionController =
      ActionController(name: '_AuthStore', context: context);

  @override
  void login(String _phoneNumber) {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.login');
    try {
      return super.login(_phoneNumber);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logout() {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.logout');
    try {
      return super.logout();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isLoginIn: ${isLoginIn}
    ''';
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kolayca_teslimat/network/package_service.dart';
import 'package:mobx/mobx.dart';
import 'package:kolayca_teslimat/injector.dart' as injector;

import '../models/package_model.dart';
part 'package_store.g.dart';

class PackageStore = _PackageStore with _$PackageStore;

abstract class _PackageStore with Store{
  final PackageService packageService = injector.serviceLocator.get<PackageService>();


  @observable
  List<PackageModel> packages = ObservableList.of([]);

  @observable
  int? choosePackageId;

  @computed
  PackageModel? get package => packages.firstWhere((element) => element.id == choosePackageId);

  @action
  Future<void> fetchPackages() async {
    try {
      List<PackageModel> fetchedPackages = await packageService.getPackages();

      packages.clear();
      packages.addAll(fetchedPackages);
    } catch (err) {
      throw Exception('Failed to fetch packages');
    }
  }

  @action
  Future<void> moveToCar() async {
    PackageModel newPackage = await packageService.moveToCar(package!.id);

    int indexOf = packages.indexOf(package!);
    packages[indexOf] = newPackage;
  }

  @action
  void choosePackage(PackageModel _package) {
    choosePackageId = _package.id;
  }


}
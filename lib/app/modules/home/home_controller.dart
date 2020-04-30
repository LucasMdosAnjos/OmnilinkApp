import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:permissions_plugin/permissions_plugin.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  AnimationController controllerAnimation;
  AnimationController controllerCard;
  Animation<double> cardSize;
  Animation<double> opacity;

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
  Future getPermissions() async {
      Map<Permission, PermissionState> permission = await PermissionsPlugin
    .requestPermissions([
        Permission.ACCESS_FINE_LOCATION,
        Permission.ACCESS_COARSE_LOCATION,
    ]);
    Map<Permission, PermissionState> permission1 = await PermissionsPlugin
    .checkPermissions([
      Permission.ACCESS_FINE_LOCATION,
      Permission.ACCESS_COARSE_LOCATION,
    ]);
  }
}

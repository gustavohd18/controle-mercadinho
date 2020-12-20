
import 'package:controle_do_mercadinho/main.dart';
import 'package:controle_do_mercadinho/service/database.dart';
import 'package:controle_do_mercadinho/service/databaseInterface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<IDatabase>((i) => ItemDatabase.instance),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, args) => MyHomePage()),
      ];

  static Inject get to => Inject.of();

  @override
  Widget get bootstrap => AppWidget();
}

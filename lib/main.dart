import 'package:controle_do_mercadinho/store/items/items_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app/app_module.dart';
import 'components/custom_dialog.dart';
import 'components/itemList.dart';

void main() {
   runApp(ModularApp(
    module: AppModule(),
  ));
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ModularState<MyHomePage, ItemsController> {
  @override
  void initState() {
    super.initState();
    this.controller.reload();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("Controle de mercadinho"),
      ),
      body: Center(
       
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        Expanded(
          child: Observer(
            builder: (_) => ItemList(
              this.controller.items,
              "Sem item"
      
            ),
          ),
        ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:  (){
                showDialog(context: context,
                  builder: (BuildContext context){
                  return CustomDialogBox(
                    title: "Adicionar item",
                    descriptions: "Hii all this is a custom dialog in flutter and  you will be use in your flutter applications",
                    text: "Adicionar",
                    f: this.controller.reload,
                  );
                  }
                );
              },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}

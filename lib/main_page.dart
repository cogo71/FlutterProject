import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'hamburger.dart';
import 'model.dart';
import 'item_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('Building $runtimeType');

    return Scaffold(
        appBar: AppBar(
          title: const Text(//utilizzo const perchè tanto non cambierà mai
              'Ultimate List'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                const Color.fromRGBO(29, 53, 87, 1),
                const Color.fromRGBO(69, 123, 157, 1),
              ], stops: [
                0.0,
                1.0
              ], tileMode: TileMode.clamp),
            ),
          ),
          //backgroundColor: Color.fromRGBO(230, 57, 70, 1)
        ),
        drawer: myDrawer(),
        body: Container(
            color: Color.fromRGBO(29, 53, 87, 1),
            padding: const EdgeInsets.all(15),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: Selector<ToBuyList, int>(
                      selector: (context, model) => model.totalCount,
                      builder: (context, selector, _) {
                        debugPrint('Building Consumer ListView');
                        return ListView.builder(
                          itemCount: selector,
                          itemBuilder: (context, index) {
                            final item = context.read<ToBuyList>().tobuy[index];
                            return ChangeNotifierProvider.value(
                              value: item,
                              child: _ItemViewer(index),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    //usiamo consumer perchè ricostruire solo questo oggetto
                    child: Consumer<ToBuyList>(
                      builder: (content, tobuy, _) {
                        // _ indica di ignorare il terzo parametro che in questo caso non usiamo altrimenti avrei child
                        debugPrint('building del consumer');
                        return Text('Prodotti in lista: ${tobuy.totalCount}',
                            style: TextStyle(color: Colors.white));
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(
                          child: const Icon(Icons.add),
                          tooltip: 'Premi per aggiungere un articolo',
                          backgroundColor: Color.fromRGBO(230, 57, 70, 1),
                          onPressed: () {
                            context.read<ToBuyList>().Add('prodotto');
                          }),
                      FloatingActionButton(
                          child: const Icon(Icons.clear_all),
                          tooltip: 'Premi per eliminare tutti gli articolo',
                          backgroundColor: Color.fromRGBO(230, 57, 70, 1),
                          onPressed: () {
                            context.read<ToBuyList>().dismissAll();
                          }),
                    ],
                  )
                ])));
  }
}

class _ItemViewer extends StatelessWidget {
  final int index;
  _ItemViewer(this.index); //indice del singolo item per individuare la pagina

  @override
  Widget build(BuildContext context) {
    debugPrint('Building $runtimeType');

    return GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) async {
          var dachiudere = await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Elimina'),
                  content:
                      Text('Sei sicuro di voler eliminare questo prodotto?'),
                  backgroundColor: Color.fromRGBO(69, 123, 157, 0.8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  actions: [
                    TextButton(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)))),
                    TextButton(
                        child: Text('Annulla'),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white)))),
                  ],
                );
              });
          if (dachiudere != null && dachiudere) {
            context.read<ToBuyList>().Delete(index);
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed('/');
          }
        },
        onTap: () {
          final item = context.read<ToBuyItem>();

          Navigator.of(context).pushNamed('/item/${index}');
        },
        child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color.fromRGBO(69, 123, 157, 1),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(241, 230, 238, 1),
                    blurRadius: 6,
                    offset: Offset(3, 3))
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    context.watch<ToBuyItem>().text,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )));
  }
}

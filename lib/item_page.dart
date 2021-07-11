import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  TextEditingController _ctrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _ctrl = TextEditingController(text: this.context.read<ToBuyItem>().text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _ctrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Building $runtimeType');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dettaglio prodotto'),
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
        //backgroundColor: Color.fromRGBO(230, 57, 70, 1),
      ),
      body: Container(
        color: Color.fromRGBO(29, 53, 87, 1),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.watch<ToBuyItem>().text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
                autofocus: true,
                style: TextStyle(color: Colors.white),
                controller: _ctrl,
                onChanged: (stringa) {
                  debugPrint('contenuto ${stringa}');
                  context.read<ToBuyItem>().setText(stringa);
                }),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                    child: const Icon(Icons.done_sharp),
                    tooltip: 'Premi per salvare le modifiche',
                    backgroundColor: Color.fromRGBO(230, 57, 70, 1),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

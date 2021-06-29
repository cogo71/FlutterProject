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
        title: Text('Item details'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              //'Title',
              context.watch<ToBuyItem>().text,
              style: Theme.of(context).textTheme.headline4,
            ),
            TextField(
                controller: _ctrl,
                onChanged: (stringa) {
                  debugPrint('contenuto ${stringa}');
                  context.read<ToBuyItem>().setText(stringa);
                }),
            Text(context.watch<ToBuyItem>().text),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text('Is done: '),
                Checkbox(
                  value: context.watch<ToBuyItem>().bought,
                  onChanged: (value) {
                    context.read<ToBuyItem>().toggle();
                  },
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('Go back'),
                  onPressed: () async {
                    // Apertura asincrona di dialogo
                    var mustClose = await showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Sei sicuro?'),
                            content: Text(
                                'Elit ipsum et aliqua enim commodo velit eiusmod aute occaecat deserunt excepteur duis officia. Magna ad tempor minim ea cillum ad velit dolor. Dolor laboris ad eiusmod cupidatat fugiat sit adipisicing consequat amet enim ut ex proident labore.'),
                            actions: [
                              TextButton(
                                  child: Text('Ok!'),
                                  onPressed: () {
                                    // Chiusura del dialogo con valore di ritorno true
                                    Navigator.of(context).pop(true);
                                  },
                                  style: ButtonStyle(
                                      textStyle: MaterialStateProperty.all(
                                          TextStyle(
                                              fontWeight: FontWeight.bold)))),
                              TextButton(
                                child: Text('Annulla'),
                                onPressed: () {
                                  // Chiusura del dialogo con valore di ritorno false
                                  Navigator.of(context).pop(false);
                                },
                              )
                            ],
                          );
                        });

                    if (mustClose != null && mustClose)
                      Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: Text('Apri pagina about'),
                  onPressed: () {
                    // Apertura di pagina sopra a pagina corrente
                    // Navigator.of(context).pushNamed('/about');

                    // Rimuove pagine finché non ne trova una con route di nome '/' (la pagina principale)
                    // Poi aggiunge la pagina about
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/about', (route) => route.settings.name == '/');
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

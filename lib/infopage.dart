import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Come Funziona'),
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
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                color: Color.fromRGBO(29, 53, 87, 1),
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(padding: EdgeInsets.fromLTRB(20, 20, 20, 10)),
                    Text('Ultimate List',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32.0,
                          color: Color.fromRGBO(230, 57, 70, 1),
                          fontWeight: FontWeight.bold,
                        )),
                    //Spacer(),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                            color: Color.fromRGBO(69, 123, 157, 1), width: 1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'Nella pagina iniziale è possibile aggiungere prodotti utilizzando il bottone ',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            WidgetSpan(
                                child: Icon(Icons.add,
                                    size: 20,
                                    color: Color.fromRGBO(230, 57, 70, 1))),
                            TextSpan(
                              text:
                                  '\n \nPer eliminare un prodotto della lista trascinarlo verso destra.'
                                  '\n \nPer cancellare tutta i prodotti dalla lista, utilizzare il bottone ',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            WidgetSpan(
                                child: Icon(Icons.clear_all,
                                    size: 20,
                                    color: Color.fromRGBO(230, 57, 70, 1))),
                            TextSpan(
                              text:
                                  '\n \nPer modificare il nome di un prodotto tappare sulla tile corrispondente.'
                                  '\n \nIn dettaglio prodotto è possibile inserire una descrizione completa e confermarla con il bottone ',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            WidgetSpan(
                                child: Icon(Icons.done,
                                    size: 20,
                                    color: Color.fromRGBO(230, 57, 70, 1))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

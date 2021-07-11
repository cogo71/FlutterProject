import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
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
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Progetto realizzato nell\'ambito del corso di Laurea Magistrale in Informatica Applicata\n'
                                'Università degli Studi di Urbino'
                                '\nCarlo Bo. \n \nCorso di Applicazioni Software e Programmazione per Dispositivi Mobili (A/A 2020/21)\n'
                                '\nTitolare del corso: \nProf. Cuno Lorenz Klopfenstein',
                            //'\n \nUltimate List è stata realizzata da Andrea Cogorno'
                            //'\na.cogorno@campus.uniurb.it',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class myDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(69, 123, 157, 1),
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(12),
                color: Color.fromRGBO(29, 53, 87, 1),
              ),
              child: Text('Ultimate List \n\nAndrea Cogorno',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(241, 230, 238, 1)))),
          ListTile(
            title: Text('Come Funziona',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/info');
            },
          ),
          ListTile(
              title: Text('About',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/about');
              }),
        ],
      ),
      //decoration: BoxDecoration(gradient(colors:[const Color.fromRGBO(29, 53, 87, 1), const Color.fromRGBO(69, 123, 157, 1)],)),
    );
  }
}

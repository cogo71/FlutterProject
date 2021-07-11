import 'package:flutter/material.dart';

class myDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Color.fromRGBO(168, 218, 220, 1),
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/bg-747.jpg'),
                ),
              ),
              child: Stack(children: <Widget>[
                Positioned(
                    bottom: 12.0,
                    left: 16.0,
                    child: Text('Ultimate List',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500))),
              ])),
          ListTile(
            title: Text('Come Funziona',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
            trailing: Icon(Icons.settings_applications),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/info');
            },
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
              title: Text('About',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
              trailing: Icon(Icons.info_outline),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/about');
              }),
          Divider(
            height: 1,
            thickness: 1,
          ),
        ],
      ),
    ));
  }
}

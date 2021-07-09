import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  int _tabIndex = 0;

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
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Builder(
            builder: (context) {
              switch (_tabIndex) {
                case 1:
                  return LayoutBuilder(builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Changelog',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          SizedBox(height: 20),
                          Text('November 2020',
                              style: Theme.of(context).textTheme.headline5),
                          Text(
                              'Nostrud elit enim fugiat dolor quis deserunt dolor. Duis velit dolor proident ea do voluptate. Culpa eu commodo proident officia. Amet id dolore incididunt in aliquip Lorem elit Lorem ex laboris nisi ex irure.'),
                          Divider(),
                          Text('October 2020',
                              style: Theme.of(context).textTheme.headline5),
                          Text(
                              'Nostrud elit enim fugiat dolor quis deserunt dolor. Duis velit dolor proident ea do voluptate. Culpa eu commodo proident officia. Amet id dolore incididunt in aliquip Lorem elit Lorem ex laboris nisi ex irure.'),
                        ],
                      ),
                    );

                    /*return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Changelog',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              SizedBox(height: 20),
                              Text('November 2020',
                                  style: Theme.of(context).textTheme.headline5),
                              Text(
                                  'Nostrud elit enim fugiat dolor quis deserunt dolor. Duis velit dolor proident ea do voluptate. Culpa eu commodo proident officia. Amet id dolore incididunt in aliquip Lorem elit Lorem ex laboris nisi ex irure.'),
                              Divider(),
                              Text('October 2020',
                                  style: Theme.of(context).textTheme.headline5),
                              Text(
                                  'Nostrud elit enim fugiat dolor quis deserunt dolor. Duis velit dolor proident ea do voluptate. Culpa eu commodo proident officia. Amet id dolore incididunt in aliquip Lorem elit Lorem ex laboris nisi ex irure.'),
                            ],
                          ),
                        ),
                      ),
                    );*/
                  });

                case 2:
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Copyright',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(height: 20),
                      Text('All your copyrights are belong to us.'),
                      SizedBox(height: 20),
                      Icon(
                        Icons.copyright,
                        size: 50,
                      ),
                    ],
                  );

                case 0:
                default:
                  return Text('About page');
              }
            },
          )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.help_rounded), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Changelog'),
          BottomNavigationBarItem(
              icon: Icon(Icons.copyright), label: 'Copyright'),
        ],
      ),
    );
  }
}

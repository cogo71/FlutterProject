import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
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

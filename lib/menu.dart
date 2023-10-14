import 'package:flutter/material.dart';
import 'package:verde_saber/chat.dart';
import 'package:verde_saber/start.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Image.asset('./assets/logo-menor-verde-saber.png'),
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: new Text("João Silva"),
                accountEmail: new Text("agro@admin.com")),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Perfil"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.analytics_outlined),
              title: Text("Relatórios"),
            ),
            ListTile(
              leading: Icon(Icons.cloud_sync_outlined),
              title: Text("Sincronismo"),
            ),
            ListTile(
              leading: Icon(Icons.edit_calendar),
              title: Text("Agenda"),
            ),
            ListTile(
              leading: Icon(Icons.notification_important_outlined),
              title: Text("Notificações"),
            ),
            ListTile(
              leading: Icon(Icons.keyboard_return),
              title: Text("Sair"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StartApp(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(10.0),
              child: InkWell(
                 onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatApp(),
                    ),
                  );
                },
                splashColor: Colors.indigo,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.mark_chat_read,
                        size: 70.0,
                        color: Colors.deepOrangeAccent,
                      ),
                      Text("Acesso à Informação",
                          textAlign: TextAlign.center,
                          style: (TextStyle(
                            fontSize: 16,
                            color: Colors.deepOrangeAccent,
                          ))),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10.0),
              child: InkWell(
                /*onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Monitoramento(),
                    ),
                  );
                },*/
                splashColor: Colors.indigo,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.radio,
                        size: 70.0,
                        color: Colors.black54,
                      ),
                      Text(
                        "Rádio",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {},
                splashColor: Colors.indigo,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.analytics_outlined,
                        size: 70.0,
                        color: Colors.black54,
                      ),
                      Text("Relatórios",
                          style: (TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ))),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {},
                splashColor: Colors.indigo,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.edit_calendar,
                        size: 70.0,
                        color: Colors.black54,
                      ),
                      Text("Agenda",
                          style: (TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ))),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {},
                splashColor: Colors.indigo,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.cloud_sync_outlined,
                        size: 70.0,
                        color: Colors.black54,
                      ),
                      Text("Sincronismo",
                          style: (TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ))),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {},
                splashColor: Colors.indigo,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.add_alert_outlined,
                        size: 70.0,
                        color: Colors.black54,
                      ),
                      Text("Novidades",
                          textAlign: TextAlign.center,
                          style: (TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ))),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {},
                splashColor: Colors.indigo,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.calculate_outlined,
                        size: 70.0,
                        color: Colors.black54,
                      ),
                      Text("Calculadora Agrícola",
                          textAlign: TextAlign.center,
                          style: (TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ))),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {},
                splashColor: Colors.indigo,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.settings_outlined,
                        size: 70.0,
                        color: Colors.black54,
                      ),
                      Text("Configurações",
                          textAlign: TextAlign.center,
                          style: (TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ))),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

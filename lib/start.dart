import 'package:flutter/material.dart';
import 'package:flutter/src/material/text_button.dart';
import 'package:verde_saber/menu.dart';

class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 100,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(child: Image.asset('./assets/logo-verde-saber.png')),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'agro@exemplo.com',
                  /*                 filled: true,
                  fillColor: Color(0xFF8BAEDC),*/
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black38,
                  ),
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  )),
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  "Recuperar Senha",
                  textAlign: TextAlign.right,
                ),
                onPressed: () {
                  /* Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordPage(),
                    ),
                  );*/
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(

              child: ElevatedButton(

                child: Text(

                  "Entrar",
                  textAlign: TextAlign.right,
                ),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20)
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Menu(),
                    ),
                  );
                },

              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.center,
              child: TextButton(
                child: Text(
                  'Cadastrar-se',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  /* Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordPage(),
                    ),
                  );*/
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {  },
                child: Text.rich(
                  TextSpan(
                    text: 'Precisa de ajuda? ',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Acessar tutorial',
                          style: TextStyle(
                            //decoration: TextDecoration.underline,
                              color: Colors.blueGrey)),
                    ],
                  ),
                ),
               /* onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GettingStartedScreen()),
                  );
                },*/
              ),
            ),
          ],
        ),
      ),
    );
  }
}

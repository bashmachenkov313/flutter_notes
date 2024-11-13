import 'package:flutter/material.dart';
import 'package:test_drive/repositories/ApiConnection.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Авторизация"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0,0,40.0,40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Login',
                    hintText: "Ваш логин",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    prefixIcon: const Icon(Icons.login),
                  ),
                ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: "Ваш пароль",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: const Icon(Icons.password),

                    ),
                    obscureText: true,
                  ),

                  Padding(padding: const EdgeInsets.fromLTRB(40.0,20,40.0,0),
                      child:ElevatedButton(
                          onPressed: (){
                            ApiConnection().GetNotesList("testuser", "testpassword");
                          },
                          style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                              foregroundColor: WidgetStatePropertyAll<Color>(Colors.black)
                      ),
                          child: const Text("Войти"),
                      ),
                  ),
                  Padding(padding: const EdgeInsets.fromLTRB(40.0,10,40.0,40.0),
                      child:TextButton(
                          onPressed: (){},
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll<Color>(Colors.transparent),
                          foregroundColor: WidgetStatePropertyAll<Color>(Colors.black)
                      ),
                          child: const Text("Нет аккаунта"),
                      )
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}

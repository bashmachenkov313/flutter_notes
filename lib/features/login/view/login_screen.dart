import 'package:flutter/material.dart';
import 'package:test_drive/repositories/ApiConnection.dart';
import 'package:motion_toast/motion_toast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String login = "";
  String password = "";
  String token = "";
  _Get_login_text(String text){
    setState(() => login = text);
  }

  _Get_password_text(String text) {
    setState(() => password = text);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Авторизация"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
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
                  onChanged: _Get_login_text,
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
                    onChanged: _Get_password_text,
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
                            ApiConnection().sign_in(login, password).then((String value){
                              if(value != "no account"){
                                token = value;
                                Navigator.of(context).pushNamed('/notesList',arguments: token);
                              }
                              else{
                                MotionToast.error(
                                    title: Text("error"),
                                    description: Text(value)
                                ).show(context);
                              }
                            });
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
                          onPressed: (){
                            Navigator.of(context).pushNamed('/registration');
                          },
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

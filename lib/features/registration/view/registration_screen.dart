import 'package:flutter/material.dart';
import 'package:test_drive/repositories/ApiConnection.dart';
import 'package:motion_toast/motion_toast.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  String login = "";
  String password = "";

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
        title: const Text("Создание аккаунта"),
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
                      onChanged:_Get_login_text,
                      decoration: InputDecoration(
                        labelText: 'Login',
                        hintText: "Желаемый логин",
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
                      onChanged:_Get_password_text,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: "Желаемый пароль",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.password),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.fromLTRB(40.0,20,40.0,0),
                      child:ElevatedButton(
                        onPressed: (){
                          ApiConnection().register(login, password).then((String value){
                              MotionToast.info(
                                  title: const Text("Уведомление!"),
                                  description: Text(value)
                              ).show(context);
                          });

                        },
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                            foregroundColor: WidgetStatePropertyAll<Color>(Colors.black)
                        ),
                        child: const Text("Создать"),
                      ),
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Создание аккаунта"),
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
                        onPressed: (){},
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

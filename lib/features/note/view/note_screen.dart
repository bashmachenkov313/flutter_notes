import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreen();
}

class _NoteScreen extends State<NoteScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Ваша заметка №"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Form(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(40.0,20,40.0,40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Title',
                        hintText: "Ваш заголовок",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        prefixIcon: const Icon(Icons.title_rounded),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLines: 8,
                      decoration: InputDecoration(
                          labelText: 'Text',
                          hintText: "Ваш текст" ,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.text_fields),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          child:  ElevatedButton(

                            onPressed: (){},
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll<Color>(Colors.redAccent),
                              foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                            ),
                            child: const Text("Удалить")
                          ),
                        ),
                        Align(
                          child:  ElevatedButton(
                            onPressed: (){},

                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll<Color>(Colors.redAccent),
                              foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                            ),
                            child: const Text("Закрыть"),
                          ),
                        ),

                      ],
                    ),
                    Align(
                      child:  ElevatedButton(
                        onPressed: (){},
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll<Color>(Colors.greenAccent),
                          foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                        ),
                        child: const Text("Сохранить"),
                      ),
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

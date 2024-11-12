import 'package:flutter/material.dart';

class NotesListScreen extends StatefulWidget {
  const NotesListScreen({super.key});

  @override
  State<NotesListScreen> createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ваши заметки"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body:Column(
        children: <Widget>[
          Flexible(child: Container(
            child: ListView.separated(
              separatorBuilder: (context,index) => const Divider(),
              itemCount: 16,
              itemBuilder: (context,index) {
                return ListTile(
                  title: Text("1"),
                );
              },
            ),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child:  ElevatedButton(
                  onPressed: (){},
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.redAccent),
                    foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                  ),
                  child: const Text("Выйти"),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child:  ElevatedButton(
                  onPressed: (){},
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.greenAccent),
                    foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                  ),
                  child: const Text("Добавить"),
                ),
              )
            ],
          )
        ],
      )
    );



  }
}

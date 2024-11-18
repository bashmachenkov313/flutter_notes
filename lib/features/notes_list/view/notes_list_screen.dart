import 'package:flutter/material.dart';
import 'package:test_drive/features/notes_list/widgets/notes_list_tile.dart';
import 'package:test_drive/models/Note.dart';
import 'package:test_drive/repositories/ApiConnection.dart';

class NotesListScreen extends StatefulWidget {
  const NotesListScreen({super.key});

  @override
  State<NotesListScreen> createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {

  late String token = "";

  @override
  void didChangeDependencies() async{
    final args  = ModalRoute.of(context)?.settings.arguments;
    if(args != null){
      token = args as String;
    }
    await _loadNotes();
    super.didChangeDependencies();
  }
  List<Note>? _NotesList;

  Future<void> _loadNotes() async{
    _NotesList = await ApiConnection().GetNotesList(token);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ваши заметки"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body:Column(
        children: <Widget>[
          Flexible(
              child: Container(
                decoration:BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                ),
            child: (_NotesList == null)
            ? const Center(child:CircularProgressIndicator())
            : ListView.separated(
              itemCount: _NotesList!.length,
              separatorBuilder: (context,index) => const Divider(),
              itemBuilder: (context,index) {
                final note = _NotesList![index];
                return  Notes_List_Tile(note: note);
              },
            ),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0,10.0,0,10.0),
                child: Align(
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
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,10.0,0,10.0) ,
                child:Align(
                  alignment: Alignment.bottomCenter,
                  child:  ElevatedButton(
                    onPressed: (){},
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(Colors.greenAccent),
                      foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                    ),
                    child: const Text("Добавить"),
                  ),
                ) ,
              )
            ],
          )
        ],
      )
    );



  }
}

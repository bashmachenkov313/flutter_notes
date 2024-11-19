import 'package:flutter/material.dart';
import '../../../models/Note.dart';
import '../../../repositories/ApiConnection.dart';

class Notes_List_Tile extends StatelessWidget{
  const Notes_List_Tile({
    Key? key,
    required this.note,
    required this.token
  }) : super(key: key);

  final Note note;
  final String token;
  @override
  Widget build(BuildContext context) {
    late String content;

    Future<void> _getContent() async{
      String text = await ApiConnection().get_note_content(token, note.id);
      content = text;
    }
    _getContent();
    final theme = Theme.of(context);
    return ListTile(
        title: Text(
          note.title,
          style: theme.textTheme.bodyMedium,
        ),
        trailing: const Icon(Icons.arrow_forward),
        onTap: (){
          Navigator.of(context).pushNamed(
              '/note',
            arguments: [note.title,note.id,token,content]
          );
        },
    );
  }
}
import 'package:flutter/material.dart';
import '../../../models/Note.dart';

class Notes_List_Tile extends StatelessWidget{
  const Notes_List_Tile({
    Key? key,
    required this.note,
  }) : super(key: key);

  final Note note;
  @override
  Widget build(BuildContext context) {
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
            arguments: note
          );
        },
    );
  }
}
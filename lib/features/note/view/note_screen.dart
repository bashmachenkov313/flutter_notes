import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:test_drive/repositories/ApiConnection.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreen();
}

class _NoteScreen extends State<NoteScreen> {


  @override
  void didChangeDependencies() async{
    final args  = ModalRoute.of(context)?.settings.arguments;
    if(args is List && args.isNotEmpty){
      id = args[1];
      title = args[0];
      token = args[2];
      content = args[3];
    }
    else{
      content = "";
    }
    super.didChangeDependencies();
  }

  int id = 1;
  String title = "New_Note";
  String content = "Your content";
  String token = "";

  _Get_title_text(String text){
    setState(() => title = text);
  }

  _Get_content_text(String text) {
    setState(() => content = text);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Ваша заметка №" + id.toString())  ,
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
                      initialValue: title,
                      onChanged: _Get_title_text,
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
                      initialValue : content,
                      onChanged: _Get_content_text,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(padding: const EdgeInsets.fromLTRB(0,10.0,0,10.0),
                        child:Align(
                          child:  ElevatedButton(
                              onPressed: (){
                                ApiConnection().remove_note(token, id).then((String value){
                                  MotionToast.info(
                                      title: const Text("Уведомление!"),
                                      description: Text(value)
                                  ).show(context);
                                  Navigator.pop(context);
                                });
                              },
                              style: const ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll<Color>(Colors.redAccent),
                                foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                              ),
                              child: const Text("Удалить")
                          ),
                        ),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(0,10.0,0,10.0),
                        child:Align(
                          child:  ElevatedButton(
                            onPressed: (){
                              ApiConnection().change_note(token, id, title, content).then((String value){
                                MotionToast.info(
                                    title: const Text("Уведомление!"),
                                    description: Text(value)
                                ).show(context);
                                Navigator.pop(context);
                              });
                            },
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll<Color>(Colors.greenAccent),
                              foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                            ),
                            child: const Text("Сохранить"),
                          ),
                        ) ,)
                      ],
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

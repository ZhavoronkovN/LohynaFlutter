import 'package:flutter/material.dart';
import '../../services/notesService.dart';

class NoteCreate extends StatelessWidget {
  final _titleController = TextEditingController();
  final _deadlineController = TextEditingController();
  final _contentController = TextEditingController();
  NoteInfo gatherInfo() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.done),
              onPressed: () => Navigator.pop(context, gatherInfo())),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Title : "),
                TextField(),
              ],
            ),
            Row(
              children: <Widget>[
                Text("Subject : "),
                DropdownButton<String>(
                    onChanged: (String value) => {},
                    hint: Text("Subject"),
                    items: <String>["PE", "OM", "AI"]
                        .map<DropdownMenuItem<String>>((e) =>
                            DropdownMenuItem<String>(value: e, child: Text(e)))
                        .toList()),
              ],
            ),
            Row(
              children: <Widget>[
                Text("Deadline : "),
                TextField(),
              ],
            ),
            Row(
              children: <Widget>[
                Text("Content : "),
                TextField(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

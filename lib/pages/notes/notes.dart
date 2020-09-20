import 'package:flutter/material.dart';
import '../../services/notesService.dart';
import '../../widgets/appDrawer.dart';
import 'noteCreate.dart';
import 'note.dart';

class NotesPage extends StatefulWidget {
  final NotesService _service = NotesService();
  @override
  State<StatefulWidget> createState() {
    return _NotesState(_service);
  }
}

class _NotesState extends State<NotesPage> {
  final NotesService _service;
  List<NoteInfo> _notes;
  _NotesState(NotesService service) : _service = service;
  @override
  void initState() {
    _notes = _service.getNotes();
    super.initState();
  }

  void deleteThis(NoteInfo info) {
    setState(() {
      _notes.removeWhere((NoteInfo toDel) => toDel.Title == info.Title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      drawer: AppDrawer(context),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: _NotesBody(_notes, deleteThis),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NoteCreate()))
              .then((result) => {
                    if (result) {setState(() => _notes.add(result))}
                  })
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _NotesBody extends StatelessWidget {
  final List<NoteInfo> notes;
  final Function onDelete;
  _NotesBody(this.notes, this.onDelete);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _NoteToolFilter(),
        _NoteToolSort(),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                    _Note.fromInfo(
                      notes[index],
                      onDelete: onDelete,
                    ),
                itemCount: notes.length)),
      ],
    );
  }
}

class _NoteToolFilter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NoteTypeState();
}

class _NoteTypeState extends State<_NoteToolFilter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        DropdownButton<String>(
            onChanged: (String value) => {},
            hint: Text("Subject"),
            items: <String>["All", "PE", "OM", "AI"]
                .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem<String>(value: e, child: Text(e)))
                .toList()),
      ],
    );
  }
}

class _NoteToolSort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text("Sort by : "),
      ],
    );
  }
}

class _Note extends StatelessWidget {
  final String title;
  final String content;
  final String subject;
  final bool finished;
  final DateTime created;
  final DateTime deadline;
  final Function onDelete;
  _Note.fromInfo(NoteInfo info, {this.onDelete})
      : title = info.Title,
        content = info.Content,
        subject = info.Subject,
        deadline = info.Deadline,
        created = info.Created,
        finished = info.Finished;
  NoteInfo getInfo() {
    return NoteInfo(title, content, created, deadline, subject, finished);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Note(getInfo())))
          .then((result) {
        print(result);
        if (result == false) {
          onDelete(getInfo());
        }
      }),
      child: NoteBody.fromInfo(getInfo()),
    );
  }
}

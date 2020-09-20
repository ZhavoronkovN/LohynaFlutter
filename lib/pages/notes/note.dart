import 'package:flutter/material.dart';
import '../../services/notesService.dart';

class Note extends StatefulWidget {
  final NoteInfo info;
  Note(this.info);
  @override
  State<StatefulWidget> createState() {
    return _NoteState(info);
  }
}

class _NoteState extends State<Note> {
  NoteInfo info;
  _NoteState(this.info);
  Widget buildRead(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => Navigator.pop(context, false)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: NoteBody.fromInfo(info),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildRead(context);
  }
}

class NoteBody extends StatelessWidget {
  final String title;
  final String content;
  final String subject;
  final bool finished;
  final DateTime created;
  final DateTime deadline;
  NoteBody.fromInfo(NoteInfo info)
      : title = info.Title,
        content = info.Content,
        subject = info.Subject,
        deadline = info.Deadline,
        created = info.Created,
        finished = info.Finished;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                subject,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              Text(
                "Deadline : ${deadline.toString()}",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              Text(
                content,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "Created : ${created.toString()}",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ]
                .map((e) => Padding(
                      padding: EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: e,
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}

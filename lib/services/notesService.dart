class NotesService {
  List<NoteInfo> getNotes(
      [String username, DateTime from, DateTime to, String Subject]) {
    return <NoteInfo>[
      NoteInfo("Title for note", "Text for note", DateTime.now(),
          DateTime(2020, 9, 10), "PE", false)
    ].toList();
  }
}

class NoteInfo {
  String Title;
  String Content;
  final DateTime Created;
  DateTime Deadline;
  String Subject;
  bool Finished;
  NoteInfo(this.Title, this.Content, this.Created, this.Deadline, this.Subject,
      this.Finished);
}

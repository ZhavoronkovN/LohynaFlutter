import 'package:flutter/material.dart';
import '../services/newsService.dart';
import '../widgets/appDrawer.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      drawer: AppDrawer(context),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: _NewsBody(NewsService()),
      ),
    );
  }
}

class _NewsBody extends StatefulWidget {
  final NewsService _service;
  _NewsBody(NewsService service) : _service = service;
  @override
  State<StatefulWidget> createState() {
    return _NewsState(_service);
  }
}

class _NewsState extends State<_NewsBody> {
  final NewsService _service;
  List<NewsInfo> _news;
  _NewsState(NewsService service) : _service = service;
  @override
  void initState() {
    _news = _service.getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                    _News.fromInfo(_news[index]),
                itemCount: _news.length)),
      ],
    );
  }
}

class _News extends StatelessWidget {
  final String title;
  final String content;
  final DateTime time;
  final String photo;
  _News(this.title, this.content, this.time, this.photo);
  _News.fromInfo(NewsInfo info)
      : title = info.Title,
        content = info.Content,
        time = info.Time,
        photo = info.Photo;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          Image.asset(photo),
          Text(
            content,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          ButtonBar(children: <Widget>[
            DropdownButton<String>(
                onChanged: (String value) => {},
                hint: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    "Share with",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                items: <String>["Group", "Person..."]
                    .map<DropdownMenuItem<String>>((e) =>
                        DropdownMenuItem<String>(value: e, child: Text(e)))
                    .toList()),
          ]),
        ]
            .map((e) => Padding(
                  padding: EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: e,
                ))
            .toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showBottomSheet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemBuilder: (context, index) => ListItem(() {
              setState(() {
                showBottomSheet = !showBottomSheet;
              });
            }),
          ),
          showBottomSheet
              ? DraggableScrollableSheet(
                  minChildSize: 0,
                  maxChildSize: 0.9,
                  initialChildSize: 0.4,
                  builder: (context, scrollController) {
                    return ListView.builder(
                        controller: scrollController,
                        itemCount: 20,
                        itemBuilder: (context, index) => SheetItem(index));
                  },
                )
              : Container(),
        ],
      ),
      appBar: AppBar(
        title: Text("Healofy"),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final VoidCallback onCommentClick;

  const ListItem(this.onCommentClick, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "Healofy: Indian Pregnancy & Baby Care App",
              style: Theme.of(context)
                  .textTheme
                  .subhead
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
          Container(
            color: Colors.grey[200],
            child: AspectRatio(
              child: Icon(
                Icons.image,
                size: 100,
              ),
              aspectRatio: 1,
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            buttonPadding: EdgeInsets.all(0),
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.thumb_up),
                  label: Text("LIKE")),
              FlatButton.icon(
                  onPressed: onCommentClick,
                  icon: Icon(Icons.comment),
                  label: Text("COMMENT")),
              FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                  label: Text("SHARE")),
            ],
          )
        ],
      ),
    );
  }
}

class SheetItem extends StatelessWidget {
  final index;

  const SheetItem(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text("Name $index"),
          subtitle: Text("Comment $index"),
        ),
      ),
    );
  }
}

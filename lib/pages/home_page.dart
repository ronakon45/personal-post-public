import 'package:flutter/material.dart';
import 'package:nextflow_personal_post/provider/post_provider.dart';
import 'package:provider/provider.dart';

import 'new_post_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PostProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MyTimeline'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        return NewPostPage();
                      },
                    ),
                  );
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Consumer<PostProvider>(
          builder: (BuildContext context, PostProvider provider, Widget child) {
            return ListView.builder(
              itemCount: provider.posts.length,
              itemBuilder: (BuildContext context, int index) {
                var post = provider.posts[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${post.timeagoMessage}',
                            style: TextStyle(
                              color: Colors.grey[400],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${post.messege}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey[300]),
                      ),
                    )
                  ],
                );
              },
            );
          },
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:nextflow_personal_post/provider/post_provider.dart';
import 'package:provider/provider.dart';

class NewPostPage extends StatelessWidget {
  // const NewPostPage({Key key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final postMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สร้างโพสใหม่'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: postMessageController,
                autofocus: true,
                maxLines: 3,
                validator: (String text) {
                  if (text.isEmpty) {
                    return 'Plz tell me ,what is happening?';
                  }

                  if (text.length < 5) {
                    return 'Plz tell me more 5 charactor.';
                  }

                  return null;
                },
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'คุณกำลังทำอะไรอยู่'),
              ),
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text('Post'),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      var message = postMessageController.text;
                      var postProvider =
                          Provider.of<PostProvider>(context, listen: false);
                      postProvider.addNewPost(message);
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextflow_personal_post/provider/post_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ตั้งค่า'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('ลบจริงงะ?'),
                    content: Text('ข้อมูลหายหมดเลยนะ'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Provider.of<PostProvider>(context, listen: false)
                                .clearAllPost();
                            Navigator.pop(context);
                          },
                          child: Text('ยืนยัน')),
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('เลิก'))
                    ],
                  );
                });

            //
          },
          child: Text('ทำลายหลักฐาน'),
        ),
      ),
    );
  }
}

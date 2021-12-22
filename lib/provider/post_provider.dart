import 'package:flutter/foundation.dart';
import 'package:nextflow_personal_post/database/post_db.dart';
import 'package:nextflow_personal_post/database/post_db_sqflite.dart';
import 'package:nextflow_personal_post/database/post_db_sqllite.dart';
import 'package:nextflow_personal_post/model/post_model.dart';

// PostDB _postDB คือ nosql
// PostDBSQFlite คือ sql
class PostProvider with ChangeNotifier {
  List<Post> _posts = [];

  // PostDB _postDB;
  PostDBSQFlite _postDB;

  List<Post> get posts => _posts;

  PostProvider() {
    // var _postDB = PostDB('app.db');
    var _postDB = PostDBSqlLite('app.db');
  }

  addNewPost(String postMessage) async {
    var post = Post(messege: postMessage, createdDate: DateTime.now());

    await _postDB.save(post);

    var postFromDB = await _postDB.loadAllPosts();

    _posts = postFromDB;

    notifyListeners();
  }

  initData() async {
    _posts = await _postDB.loadAllPosts();
    notifyListeners();
  }

  clearAllPost() async {
    await _postDB.clearPostData();
    _posts = [];
    notifyListeners();
  }
}

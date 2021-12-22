import 'package:sembast/sembast.dart';
import 'package:timeago/timeago.dart' as timeago;

class Post {
  String messege;
  DateTime createdDate;

  Post({this.messege, this.createdDate});
  String get timeagoMessage {
    var now = DateTime.now();
    var duration = now.difference(this.createdDate);
    var ago = now.subtract(duration);
    var message = timeago.format(ago, locale: 'th_short');
    return message;
  }

  static Map<String, dynamic> toJson(Post post) {
    return {
      'message': post.messege,
      'createDate': post.createdDate.toIso8601String()
    };
  }

  static Post fromRecord(RecordSnapshot record) {
    var post = Post(
        messege: record['message'],
        createdDate: DateTime.parse(record['createDate']));
    return post;
  }
}

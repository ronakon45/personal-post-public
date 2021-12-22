import 'dart:io';

import 'package:nextflow_personal_post/database/post_db.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class PostDBSqlLite extends PostDB {
  PostDBSqlLite(String databaseName) : super(databaseName);

  @override
  Future<Database> openDatabase() async {
    Directory appDocumentDirectory = await getApplicationDocumentsDirectory();
    String databaseLocationInApp =
        join(appDocumentDirectory.path, this.databaseName);

    DatabaseFactory dbFactory = databaseFactoryIo;
    Database db = await dbFactory.openDatabase(databaseLocationInApp);
    return db;
  }
}

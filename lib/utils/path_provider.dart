import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:my_flutter/state/user_info.dart';

class FileManege {
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await localPath;
    return File('$path/use_info.txt');
  }

// 写入文件
  Future<File> writeCounter(UserInfoState state) async {
    final file = await _localFile;
    print(state.toJson());
    var info = json.encode(state.toJson());
    // Write the file
    return file.writeAsString('$info');
  }

// 读取文件
  Future<Map<String, dynamic>> readUserInfo() async {
    try {
      final file = await _localFile;

      // Read the file
      final infoString = await file.readAsString();

      final info = jsonDecode(infoString);

      return info;
    } catch (e) {
      // If encountering an error, return 0
      return {};
    }
  }
}

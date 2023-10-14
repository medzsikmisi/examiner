import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class Downloader {
  Future<Option<String>> downloadExamByCode(String code) {
    final url = 'https://files.catbox.moe/$code.csv';
    return download(url);
  }

  Future<Option<String>> download(String url) async {
    final tmpDir = await getTemporaryDirectory();
    String currentTimestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final downloadedFilePath =
        path.join(tmpDir.absolute.path, '$currentTimestamp.csv');
    return await Dio()
        .download(url, downloadedFilePath)
        .then((value) => Option.of(downloadedFilePath))
        .onError((error, stackTrace) => const Option.none());
  }
}

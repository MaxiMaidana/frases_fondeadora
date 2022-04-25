import 'contents.dart';
import 'copytight.dart';
import 'success.dart';

abstract class Qod {
  Qod({
    this.success,
    this.contents,
    this.baseurl,
    this.copyright,
  });

  Success? success;
  Contents? contents;
  String? baseurl;
  Copyright? copyright;
}

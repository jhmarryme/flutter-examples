import 'package:logger/logger.dart';

const String tag = "LogUtil";

class LogUtil {
  static final _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
    ),
  );

  static t(String msg, {String tag = tag}) {
    _logger.t("$tag :: $msg");
  }

  static d(String msg, {String tag = tag}) {
    _logger.d("$tag :: $msg");
  }

  static i(String msg, {String tag = tag}) {
    _logger.i("$tag :: $msg");
  }

  static w(String msg, {String tag = tag}) {
    _logger.w("$tag :: $msg");
  }

  static e(String msg, {String tag = tag}) {
    _logger.e("$tag :: $msg");
  }

  static f(String msg, {String tag = tag}) {
    _logger.f("$tag :: $msg");
  }
}

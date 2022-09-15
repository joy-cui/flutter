class LoggerUtil {
  static const String _TAG_DEF = "###LogUtil###";

  static bool debuggable = false; //是否是debug模式,true: log v 不输出.
  static String TAG = _TAG_DEF;

  static void init({bool isDebug = false, String tag = _TAG_DEF}) {
    print("测试log:logger开始初始化===");
    debuggable = isDebug;
    TAG = tag;
  }

  static void e(String tag,Object? object) {
    _printLog(tag, '  e  ', object);
  }

  static void v( String tag,Object? object) {
    if (debuggable) {
      _printLog(tag, '  v  ', object);
    }
  }

  static void _printLog(String tag, String stag, Object? object) {
    StringBuffer sb = new StringBuffer();
    sb.write((tag == null || tag.isEmpty) ? TAG : tag);
    sb.write(stag);
    sb.write(object);
    print(sb.toString());
  }
}
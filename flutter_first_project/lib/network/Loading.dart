
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Loading {
  static show() {
    EasyLoading.show(status: 'loading...');
  }

  static dismiss() {
    EasyLoading.dismiss();
  }
}

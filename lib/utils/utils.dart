import 'package:flutter/material.dart';

class Utils {
  static Future pushToNewRoute(BuildContext context, Widget newRoute) {
    return Navigator.push(context, MaterialPageRoute(builder: (_) => newRoute));
  }
}

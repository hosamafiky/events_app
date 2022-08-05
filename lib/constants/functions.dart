import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void nextPage(context, Widget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ),
  );
}

httpErrorHandling({
  required BuildContext context,
  required http.Response response,
  required VoidCallback onSuccess,
}) async {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['message']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['error']);
      break;
    default:
      print(response.body);
      showSnackBar(context, response.body);
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

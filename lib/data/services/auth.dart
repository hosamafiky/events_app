import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:events_app/constants/functions.dart';
import 'package:events_app/constants/strings.dart';
import 'package:events_app/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  late Dio dio;

  AuthServices() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.1.5:3000/api/',
        receiveDataWhenStatusError: true,
        receiveTimeout: 20 * 1000,
        sendTimeout: 20 * 1000,
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
        },
      ),
    );
  }

  void register(
    context, {
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confPassword,
  }) async {
    User user = User(
      name: name,
      email: email,
      phone: phone,
      id: '',
      token: '',
      password: password,
      confirmPassword: confPassword,
      address: '',
      type: '',
    );
    try {
      http.Response response = await http.post(
        Uri.parse('${Strings.baseUrl}/register'),
        body: jsonEncode(user.toJson()),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
        },
      );

      httpErrorHandling(
        context: context,
        response: response,
        onSuccess: () {
          showSnackBar(context, 'تم تسجيل الحساب بنجاح');
        },
      );
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
    }
  }
}

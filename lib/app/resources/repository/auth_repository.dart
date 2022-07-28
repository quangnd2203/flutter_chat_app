// ignore_for_file: avoid_dynamic_calls

import 'package:dio/dio.dart';
import '../../constants/constants.dart';
import '../../notification/firebase_messaging.dart';
import '../../utils/utils.dart';
import '../resources.dart';

class AuthRepository {

  factory AuthRepository() {
    _instance ??= AuthRepository._();
    return _instance!;
  }
  AuthRepository._();

  static AuthRepository? _instance;

  Future<NetworkState<dynamic>> loginNormal({required String email, required String password}) async {
    final bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) {
      return NetworkState<dynamic>.withDisconnect();
    }
    try {
      const String api = AppEndpoint.LOGIN_NORMAL;
      final Map<String, dynamic> params = <String, dynamic>{
        'email' : email,
        'password' : password,
        'fcmToken' : await FirebaseCloudMessaging.getFCMToken(),
      };
      final Response<dynamic> response = await AppClients().post(api, data: params);
      final NetworkState<dynamic> state = NetworkState<dynamic>.fromResponse(response, converter: (dynamic json){
        return <String, dynamic> {
          'user': json['user'] != null ? UserModel.fromJson(json['user']) : null,
          'accessToken': json['accessToken'],
        };
      });
      AppPrefs.user = state.data?['user'] as UserModel?;
      AppPrefs.accessToken = state.data?['accessToken'] as String?;
      return state;
    } on DioError catch (e) {
      return NetworkState<dynamic>.withError(e);
    }
  }

  Future<NetworkState<dynamic>> register({required String name, required String email, required String password}) async {
    final bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) {
      return NetworkState<dynamic>.withDisconnect();
    }
    try {
      const String api = AppEndpoint.REGISTER;
      final Map<String, dynamic> params = <String, dynamic>{
        'name' : name,
        'email' : email,
        'password' : password,
        'fcmToken' : await FirebaseCloudMessaging.getFCMToken(),
      };
      final Response<dynamic> response = await AppClients().post(api, data: params);
      final NetworkState<dynamic> state = NetworkState<dynamic>.fromResponse(response, converter: (dynamic json){
        return <String, dynamic> {
          'user': json['user'] != null ? UserModel.fromJson(json['user']) : null,
          'accessToken': json['accessToken'],
        };
      });
      AppPrefs.user = state.data?['user'] as UserModel?;
      AppPrefs.accessToken = state.data?['accessToken'] as String?;
      return state;
    } on DioError catch (e) {
      return NetworkState<dynamic>.withError(e);
    }
  }

  Future<NetworkState<dynamic>> loginSocial({required String socialToken, required String accountType}) async {
    final bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) {
      return NetworkState<dynamic>.withDisconnect();
    }
    try {
      const String api = AppEndpoint.LOGIN_SOCIAL;
      final Map<String, dynamic> params = <String, dynamic>{
        'socialToken' : socialToken,
        'accountType' : accountType,
        'fcmToken' : await FirebaseCloudMessaging.getFCMToken(),
      };
      final Response<dynamic> response = await AppClients().post(api, data: params);
      final NetworkState<dynamic> state = NetworkState<dynamic>.fromResponse(response, converter: (dynamic json){
        return <String, dynamic> {
          'user': json['user'] != null ? UserModel.fromJson(json['user']) : null,
          'accessToken': json['accessToken'],
        };
      });
      AppPrefs.user = state.data?['user'] as UserModel?;
      AppPrefs.accessToken = state.data?['accessToken'] as String?;
      return state;
    } on DioError catch (e) {
      return NetworkState<dynamic>.withError(e);
    }
  }

  Future<NetworkState<dynamic>> authorized() async {
    final bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) {
      return NetworkState<dynamic>.withDisconnect();
    }
    try {
      const String api = AppEndpoint.AUTHORIZED;
      final Response<dynamic> response = await AppClients().get(api);
      final NetworkState<dynamic> state = NetworkState<dynamic>.fromResponse(response, converter: (dynamic json){
        return <String, dynamic> {
          'user': json['user'] != null ? UserModel.fromJson(json['user']) : null,
          'accessToken': json['accessToken'],
        };
      });
      AppPrefs.user = state.data?['user'] as UserModel?;
      AppPrefs.accessToken = state.data?['accessToken'] as String?;
      return state;
    } on DioError catch (e) {
      return NetworkState<dynamic>.withError(e);
    }
  }
}

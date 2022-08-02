// ignore_for_file: always_specify_types

import 'package:dio/dio.dart';
import '../../constants/constants.dart';
import '../../utils/utils.dart';
import '../resources.dart';

class UserRepository{
  factory UserRepository() {
    _instance ??= UserRepository._();
    return _instance!;
  }
  UserRepository._();

  static UserRepository? _instance;

  Future<NetworkState<List<UserModel>>> getAll({int limit = 20, offset = 0}) async {
    final bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) {
      return NetworkState<List<UserModel>>.withDisconnect();
    }
    try{
      const String api = AppEndpoint.USER_GET_ALL;
      final Response<dynamic> response = await AppClients().get(api, queryParameters: <String, dynamic>{
        'limit': limit,
        'offset': offset,
      });
      final NetworkState<List<UserModel>> state = NetworkState<List<UserModel>>.fromResponse(
          response,
          converter: (dynamic json) => (json as List).map<UserModel>((e) => UserModel.fromJson(e)).toList(),
      );
      return state;
    }on DioError catch (e){
      return NetworkState<List<UserModel>>.withError(e);
    }
  }
}

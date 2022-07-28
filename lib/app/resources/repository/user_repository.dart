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

  Future<NetworkState<Iterable<UserModel>>> getAll() async {
    final bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) {
      return NetworkState<Iterable<UserModel>>.withDisconnect();
    }
    try{
      const String api = AppEndpoint.USER_GET_ALL;
      final Response<Iterable<UserModel>> response = await AppClients().get(api);
      final NetworkState<Iterable<UserModel>> state = NetworkState<Iterable<UserModel>>.fromResponse(
          response,
          converter: (dynamic json) => (json as Iterable).map<UserModel>((e) => UserModel.fromJson(e)),
      );
      return state;
    }on DioError catch (e){
      return NetworkState<Iterable<UserModel>>.withError(e);
    }
  }
}

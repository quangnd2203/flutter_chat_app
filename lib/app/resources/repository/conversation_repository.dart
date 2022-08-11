// ignore_for_file: always_specify_types

import 'package:dio/dio.dart';

import '../../constants/constants.dart';
import '../../utils/app_clients.dart';
import '../resources.dart';

class ConversationRepository{

  factory ConversationRepository(){
    _instance ??= ConversationRepository._();
    return _instance!;
  }
  ConversationRepository._();

  static ConversationRepository? _instance;

  Future<NetworkState<List<ConversationModel>>> getAllConversation({int limit = 20, offset = 0}) async {
    final bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) {
      return NetworkState<List<ConversationModel>>.withDisconnect();
    }
    try{
      const String api = AppEndpoint.CONVERSATION_GET_ALL;
      final Response<dynamic> response = await AppClients().get(api, queryParameters: <String, dynamic>{
        'limit': limit,
        'offset': offset,
      });
      final NetworkState<List<ConversationModel>> state = NetworkState<List<ConversationModel>>.fromResponse(
        response,
        converter: (dynamic json) => (json as List).map<ConversationModel>((e) => ConversationModel.fromJson(e)).toList(),
      );
      return state;
    }on DioError catch (e){
      return NetworkState<List<ConversationModel>>.withError(e);
    }
  }
}

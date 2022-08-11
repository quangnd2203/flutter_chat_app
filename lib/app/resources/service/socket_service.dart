// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:async';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '../../constants/app_endpoint.dart';
import '../../utils/utils.dart';

const List<String> socketEvent = <String>[
  'onCreateConversation',
  'onMessage',
  'test1',
  'test2',
];

typedef SocketCallBackEvent = void Function(dynamic data);

class SocketEventData{

  SocketEventData(this.event, this.data);

  final String event;
  final dynamic data;
}

class SocketService {

  factory SocketService(){
    _instance ??= SocketService._();
    if(!_instance!.isConnected){
      _instance!.init();
    }
    return _instance!;
  }
  SocketService._();

  late Socket _socket;

  final Logger _logger = Logger();

  final GetStream<SocketEventData> socketEventStream = GetStream<SocketEventData>();

  bool isConnected = false;

  static SocketService? _instance;

  void init() {
    _socket = io(
      AppEndpoint.BASE_SOCKET,
      OptionBuilder().setExtraHeaders(<String, dynamic>{
        'authorization' : 'Bearer ${AppPrefs.accessToken}',
      }).setTransports(<String>['websocket']).build(),
    );

    _socket.onConnecting(onConnecting);

    _socket.onConnect(onConnect);

    _socket.onConnectError(onConnectError);

    _socket.onDisconnect(onDisconnect);

    _socket.connect();

    socketEvent.forEach((String event) {
      _socket.on(event, (dynamic data){
        _logger.i('ON ${event.toUpperCase()}: $data');
        socketEventStream.add(SocketEventData(event, data));
      });
    });
  }

  void emit(String event, dynamic data){
    _socket.emit(event, data);
  }

  void disconnect(){
    _socket.emit('disconnect');
  }

  void onConnecting(dynamic data){
    _logger.i('ON CONNECTING $data');
  }

  void onConnect(dynamic data){
    isConnected = true;
    _logger.i('ON CONNECTED $data');
  }

  void onConnectError(dynamic data){
    _logger.i('ON CONNECT ERROR $data');
  }

  void onDisconnect(dynamic data){
    isConnected = false;
    _logger.i('ON DISCONNECT $data');
  }
}

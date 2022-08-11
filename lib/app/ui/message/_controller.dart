// ignore_for_file: always_specify_types, strict_raw_type, cancel_subscriptions

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../notification/notification.dart';
import '../../resources/resources.dart';
import '../../resources/service/socket_service.dart';
import '../../routes/app_pages.dart';
import '../../utils/utils.dart';
import '../ui.dart';

class MessageController extends BaseController {

  RxBool isShowSearch = false.obs;

  GlobalKey<WidgetSliverLoadMoreVerticalState> loadMoreKey = GlobalKey();

  SocketService socketService = SocketService();

  late StreamSubscription<SocketEventData> eventSubscription;

  @override
  Future<void> onInit() async {
    subscriptionListener();
    setLoading(true);
    setLoading(false);
    super.onInit();
  }

  void changeSearchState(){
    isShowSearch.value = !isShowSearch.value;
  }

  Future<List<ConversationModel>> getConversations(int offset) async {
    final NetworkState<List<ConversationModel>> networkState = await ConversationRepository().getAllConversation(offset: offset);
    return networkState.data ?? <ConversationModel>[];
  }

  void toConversation(ConversationModel model){
    Get.toNamed(Routes.MESSAGE_ROOM, arguments: model);
  }

  void subscriptionListener(){
    eventSubscription = socketService.socketEventStream.listen((event) {
      if(event.event == 'onMessage'){
        onMessage(event.data);
      }
    });
  }

  void onMessage(dynamic data){
    Get.find<NavigationController>().messageLoadMoreKey.currentState!.onRefresh();
  }

  // void onNotificationReceiver(){
  //   notificationSubject.listen((event) {
  //     Get.find<NavigationController>().messageLoadMoreKey.currentState!.onRefresh();
  //   });
  //   AppPrefs.notificationConversation.listen((event) {
  //     Get.find<NavigationController>().messageLoadMoreKey.currentState!.onRefresh();
  //   });
  // }
}

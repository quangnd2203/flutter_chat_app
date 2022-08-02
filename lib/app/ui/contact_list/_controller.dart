import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/repository/user_repository.dart';
import '../../resources/resources.dart';
import '../ui.dart';

class ContactListController extends BaseController {
  final ScrollController scrollController = ScrollController();

  RxBool isShowSearch = false.obs;

  @override
  Future<void> onInit() async {
    setLoading(true);
    setLoading(false);
    super.onInit();
  }

  void changeSearchState() {
    isShowSearch.value = !isShowSearch.value;
  }

  Future<List<UserModel>> getUsers(int offset) async {
    final NetworkState<Iterable<UserModel>> networkState = await UserRepository().getAll(offset: offset);
    return (networkState.data ?? <UserModel>[]).toList();
  }

  Future<void> createConversation(UserModel userModel) async {
    // final NetworkState<ConversationModel?> networkState = await ConversationRepository().createConversation(userModel);
    // if(networkState.isSuccess)
    //   Get.toNamed(Routes.MESSAGE_ROOM, arguments: networkState.data);
  }
}

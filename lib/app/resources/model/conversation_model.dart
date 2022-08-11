// ignore_for_file: avoid_dynamic_calls

import '../resources.dart';

/// id : 55
/// lastMessage : null
/// users : [{"id":436,"uid":"uid-b215d4bc-0f0d-11ed-903b-c6ef0857e0cf","name":"Nguyen Dang Quang","email":"quangnd.nta@gmail.com","accountType":"normal","avatar":null,"background":null,"createdAt":"2022-07-29T07:11:41.000Z","updatedAt":"2022-08-10T02:33:17.000Z"},{"id":437,"uid":"uid-41eb2d84-0f0f-11ed-903b-c6ef0857e0cf","name":"Kathleen Mitchell","email":"kathleen.mitchell.54195562@gmail.com","accountType":"normal","avatar":null,"background":null,"createdAt":"2022-07-29T07:22:52.000Z","updatedAt":"2022-07-29T07:22:52.000Z"}]
/// createdAt : "2022-08-09T08:59:02.000Z"
/// updatedAt : null

class ConversationModel {
  ConversationModel({
      this.id, 
      this.lastMessage, 
      this.users, 
      this.createdAt, 
      this.updatedAt,});

  ConversationModel.fromJson(dynamic json) {
    id = json['id'] as int?;
    lastMessage =  json['lastMessage'] != null ? MessageModel.fromJson(json['lastMessage']) : null;
    if (json['users'] != null) {
      users = [];
      json['users'].forEach((dynamic v) {
        users?.add(UserModel.fromJson(v));
      });
    }
    createdAt = json['createdAt'] as String?;
    updatedAt = json['updatedAt'] as String?;
  }
  int? id;
  MessageModel? lastMessage;
  List<UserModel>? users;
  String? createdAt;
  String? updatedAt;

ConversationModel copyWith({  int? id,
  MessageModel? lastMessage,
  List<UserModel>? users,
  String? createdAt,
  String? updatedAt,
}) => ConversationModel(  id: id ?? this.id,
  lastMessage: lastMessage ?? this.lastMessage,
  users: users ?? this.users,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['lastMessage'] = lastMessage;
    if (users != null) {
      map['users'] = users?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}
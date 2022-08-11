import 'model.dart';

/// id : 10
/// conversationId : 55
/// text : "aaaaa"
/// media : null
/// user : {"id":436,"uid":"uid-b215d4bc-0f0d-11ed-903b-c6ef0857e0cf","name":"Nguyen Dang Quang","email":"quangnd.nta@gmail.com","accountType":"normal","avatar":null,"background":null,"createdAt":"2022-07-29T07:11:41.000Z","updatedAt":"2022-08-10T02:33:17.000Z"}
/// createdAt : "2022-08-09T08:59:02.000Z"
/// updatedAt : null

// ignore_for_file: avoid_dynamic_calls

class MessageModel {
  MessageModel({
    this.id,
    this.conversationId,
    this.text,
    this.media,
    this.user,
    this.createdAt,
    this.updatedAt,
  });

  MessageModel.fromJson(dynamic json) {
    id = json['id'] as int?;
    conversationId = json['conversationId'] as int?;
    text = json['text'] as String?;
    media = json['media'] as String?;
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    createdAt = json['createdAt'] as String?;
    updatedAt = json['updatedAt'] as String?;
  }

  int? id;
  int? conversationId;
  String? text;
  String? media;
  UserModel? user;
  String? createdAt;
  String? updatedAt;

  MessageModel copyWith({
    int? id,
    int? conversationId,
    String? text,
    String? media,
    UserModel? user,
    String? createdAt,
    String? updatedAt,
  }) =>
      MessageModel(
        id: id ?? this.id,
        conversationId: conversationId ?? this.conversationId,
        text: text ?? this.text,
        media: media ?? this.media,
        user: user ?? this.user,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['conversationId'] = conversationId;
    map['text'] = text;
    map['media'] = media;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}

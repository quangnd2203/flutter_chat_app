/// id : 4
/// uid : "uid-25016d36-040c-11ed-b42c-c6ef0857e0cf"
/// name : "Nguyễn Đăng Quang"
/// email : "quangnd.nta@gmail.com"
/// accountType : "normal"
/// avatar : null
/// background : null
/// createAt : "2022-07-15T07:02:52.000Z"
/// updateAt : "2022-07-27T08:16:49.000Z"
// ignore_for_file: avoid_dynamic_calls

class UserModel {

  UserModel({
    this.id,
    this.uid,
    this.name,
    this.email,
    this.accountType,
    this.avatar,
    this.background,
    this.createAt,
    this.updateAt,
  });

  UserModel.fromJson(dynamic json) {
    id = json['id'] as int?;
    uid = json['uid'] as String?;
    name = json['name'] as String?;
    email = json['email'] as String?;
    accountType = json['accountType'] as String?;
    avatar = json['avatar'] as String?;
    background = json['background'] as String?;
    createAt = json['createAt'] as String?;
    updateAt = json['updateAt'] as String?;
  }

  int? id;
  String? uid;
  String? name;
  String? email;
  String? accountType;
  String? avatar;
  String? background;
  String? createAt;
  String? updateAt;

  UserModel copyWith({
    int? id,
    String? uid,
    String? name,
    String? email,
    String? accountType,
    String? avatar,
    String? background,
    String? createAt,
    String? updateAt,
  }) =>
      UserModel(
        id: id ?? this.id,
        uid: uid ?? this.uid,
        name: name ?? this.name,
        email: email ?? this.email,
        accountType: accountType ?? this.accountType,
        avatar: avatar ?? this.avatar,
        background: background ?? this.background,
        createAt: createAt ?? this.createAt,
        updateAt: updateAt ?? this.updateAt,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['uid'] = uid;
    map['name'] = name;
    map['email'] = email;
    map['accountType'] = accountType;
    map['avatar'] = avatar;
    map['background'] = background;
    map['createAt'] = createAt;
    map['updateAt'] = updateAt;
    return map;
  }

  static List<UserModel> listToJson(dynamic json) {
    List<UserModel> result = <UserModel>[];
    if (json != null) {
      final List<Map<dynamic, dynamic>> data = List<Map<dynamic, dynamic>>.from(json as List<Object?>);
      result = data.map<UserModel>((Map<dynamic, dynamic> e) => UserModel.fromJson(Map<String, dynamic>.from(e))).toList();
    }
    return result;
  }
}

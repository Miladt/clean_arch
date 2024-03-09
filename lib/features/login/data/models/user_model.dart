import 'package:clean_arch_2024/features/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    credit = json['credit'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    map['phoneNumber'] = phoneNumber;
    map['credit'] = credit;
    return map;
  }
}

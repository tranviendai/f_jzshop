// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String? id;
    String? userName;
    String? passwordHash;
    String? image;
    String? fullName;
    String? email;
    String? phoneNumber;
    String? dateCreated;
    String? role;
    bool? isActive;

    UserModel({
         this.id,
         this.userName,
         this.passwordHash,
         this.image,
         this.fullName,
         this.email,
         this.phoneNumber,
         this.dateCreated,
         this.role,
         this.isActive,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        userName: json["userName"],
        passwordHash: json["passwordHash"],
        image: json["image"],
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        dateCreated: json["dateCreated"],
        role: json["role"],
        isActive: json["isActive"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "passwordHash": passwordHash,
        "image": image,
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "dateCreated": dateCreated,
        "role": role,
        "isActive": isActive,
    };
}
